# frozen_string_literal: true

# Flattened view of the events database with one row per subject.
# Metadata is excluded
class AddFlatView < ActiveRecord::Migration[6.0]
  def up
    event_wh_db = Rails.application.config.event_wh_db

    ViewsSchema.create_view(
      'flat_events_view',
      <<~SQL
        SELECT
          #{event_wh_db}.events.id AS wh_event_id,
          #{event_wh_db}.events.uuid AS event_uuid_bin,
          INSERT(INSERT(INSERT(INSERT(LOWER(HEX(#{event_wh_db}.events.uuid)),9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-') AS event_uuid,
          #{event_wh_db}.event_types.key AS event_type,
          #{event_wh_db}.events.occured_at AS occured_at,
          #{event_wh_db}.events.user_identifier AS user_identifier,
          #{event_wh_db}.role_types.key AS role_type,
          #{event_wh_db}.subject_types.key AS subject_type,
          #{event_wh_db}.subjects.friendly_name AS subject_friendly_name,
            INSERT(INSERT(INSERT(INSERT(LOWER(HEX(#{event_wh_db}.subjects.uuid)),9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-') AS subject_uuid,
            #{event_wh_db}.subjects.uuid AS subject_uuid_bin
        FROM #{event_wh_db}.events
        LEFT OUTER JOIN #{event_wh_db}.event_types ON events.event_type_id = event_types.id
        LEFT OUTER JOIN #{event_wh_db}.roles ON roles.event_id = events.id
        LEFT OUTER JOIN #{event_wh_db}.role_types ON roles.role_type_id = role_types.id
        LEFT OUTER JOIN #{event_wh_db}.subjects ON roles.subject_id = subjects.id
        LEFT OUTER JOIN #{event_wh_db}.subject_types ON subjects.subject_type_id = subject_types.id
      SQL
    )
  end

  def down
    ViewsSchema.drop_view('flat_events_view')
  end
end
