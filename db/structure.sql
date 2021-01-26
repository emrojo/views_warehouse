
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cherrypicked_samples`;
/*!50001 DROP VIEW IF EXISTS `cherrypicked_samples`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cherrypicked_samples` AS SELECT 
 1 AS `root_sample_id`,
 1 AS `plate_barcode`,
 1 AS `phenotype`,
 1 AS `coordinate`,
 1 AS `created`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `flat_events_view`;
/*!50001 DROP VIEW IF EXISTS `flat_events_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flat_events_view` AS SELECT 
 1 AS `wh_event_id`,
 1 AS `event_uuid_bin`,
 1 AS `event_uuid`,
 1 AS `event_type`,
 1 AS `occured_at`,
 1 AS `user_identifier`,
 1 AS `role_type`,
 1 AS `subject_type`,
 1 AS `subject_friendly_name`,
 1 AS `subject_uuid`,
 1 AS `subject_uuid_bin`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP VIEW IF EXISTS `cherrypicked_samples`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cherrypicked_samples` AS select `mlwh_sample`.`description` AS `root_sample_id`,`mlwh_stock_resource`.`labware_human_barcode` AS `plate_barcode`,`mlwh_sample`.`phenotype` AS `phenotype`,`mlwh_stock_resource`.`labware_coordinate` AS `coordinate`,`mlwh_sample`.`created` AS `created` from (((((`unified_warehouse_development`.`sample` `mlwh_sample` join `unified_warehouse_development`.`stock_resource` `mlwh_stock_resource` on((`mlwh_sample`.`id_sample_tmp` = `mlwh_stock_resource`.`id_sample_tmp`))) join `event_warehouse_development`.`subjects` `mlwh_events_subjects` on((`mlwh_events_subjects`.`friendly_name` = `mlwh_sample`.`sanger_sample_id`))) join `event_warehouse_development`.`roles` `mlwh_events_roles` on((`mlwh_events_roles`.`subject_id` = `mlwh_events_subjects`.`id`))) join `event_warehouse_development`.`events` `mlwh_events_events` on((`mlwh_events_roles`.`event_id` = `mlwh_events_events`.`id`))) join `event_warehouse_development`.`event_types` `mlwh_events_event_types` on((`mlwh_events_events`.`event_type_id` = `mlwh_events_event_types`.`id`))) where (`mlwh_events_event_types`.`key` = 'cherrypick_layout_set') union select `mlwh_sample`.`description` AS `root_sample_id`,`mlwh_lh_sample`.`plate_barcode` AS `plate_barcode`,`mlwh_sample`.`phenotype` AS `phenotype`,`mlwh_lh_sample`.`coordinate` AS `coordinate`,`mlwh_sample`.`created` AS `created` from (((((`unified_warehouse_development`.`sample` `mlwh_sample` join `unified_warehouse_development`.`lighthouse_sample` `mlwh_lh_sample` on((`mlwh_sample`.`uuid_sample_lims` = `mlwh_lh_sample`.`lh_sample_uuid`))) join `event_warehouse_development`.`subjects` `mlwh_events_subjects` on((`mlwh_events_subjects`.`uuid` = unhex(replace(`mlwh_lh_sample`.`lh_sample_uuid`,'-',''))))) join `event_warehouse_development`.`roles` `mlwh_events_roles` on((`mlwh_events_roles`.`subject_id` = `mlwh_events_subjects`.`id`))) join `event_warehouse_development`.`events` `mlwh_events_events` on((`mlwh_events_events`.`id` = `mlwh_events_roles`.`event_id`))) join `event_warehouse_development`.`event_types` `mlwh_events_event_types` on((`mlwh_events_event_types`.`id` = `mlwh_events_events`.`event_type_id`))) where (`mlwh_events_event_types`.`key` = 'lh_beckman_cp_destination_created') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `flat_events_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flat_events_view` AS select `event_warehouse_development`.`events`.`id` AS `wh_event_id`,`event_warehouse_development`.`events`.`uuid` AS `event_uuid_bin`,insert(insert(insert(insert(lower(hex(`event_warehouse_development`.`events`.`uuid`)),9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-') AS `event_uuid`,`event_warehouse_development`.`event_types`.`key` AS `event_type`,`event_warehouse_development`.`events`.`occured_at` AS `occured_at`,`event_warehouse_development`.`events`.`user_identifier` AS `user_identifier`,`event_warehouse_development`.`role_types`.`key` AS `role_type`,`event_warehouse_development`.`subject_types`.`key` AS `subject_type`,`event_warehouse_development`.`subjects`.`friendly_name` AS `subject_friendly_name`,insert(insert(insert(insert(lower(hex(`event_warehouse_development`.`subjects`.`uuid`)),9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-') AS `subject_uuid`,`event_warehouse_development`.`subjects`.`uuid` AS `subject_uuid_bin` from (((((`event_warehouse_development`.`events` left join `event_warehouse_development`.`event_types` on((`event_warehouse_development`.`events`.`event_type_id` = `event_warehouse_development`.`event_types`.`id`))) left join `event_warehouse_development`.`roles` on((`event_warehouse_development`.`roles`.`event_id` = `event_warehouse_development`.`events`.`id`))) left join `event_warehouse_development`.`role_types` on((`event_warehouse_development`.`roles`.`role_type_id` = `event_warehouse_development`.`role_types`.`id`))) left join `event_warehouse_development`.`subjects` on((`event_warehouse_development`.`roles`.`subject_id` = `event_warehouse_development`.`subjects`.`id`))) left join `event_warehouse_development`.`subject_types` on((`event_warehouse_development`.`subjects`.`subject_type_id` = `event_warehouse_development`.`subject_types`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `schema_migrations` (version) VALUES
('20210115115653'),
('20210119122653');


