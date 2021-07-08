--############################################################
--# delete old data
--############################################################
UPDATE users SET prm_role_id=null;
DELETE FROM prm_role_permission;
DELETE FROM prm_permission;
DELETE FROM prm_scope;
DELETE FROM prm_role;

--############################################################
--# fill tables
--############################################################
INSERT INTO prm_role (role_id, role_name) VALUES (1, 'Manager');
INSERT INTO prm_role (role_id, role_name) VALUES (2, 'Admin');
INSERT INTO prm_role (role_id, role_name) VALUES (3, 'Administrator');
INSERT INTO prm_role (role_id, role_name) VALUES (4, 'Caller');
INSERT INTO prm_role (role_id, role_name) VALUES (5, 'SuperCaller');
INSERT INTO prm_role (role_id, role_name) VALUES (6, 'Doctor');
INSERT INTO prm_role (role_id, role_name) VALUES (7, 'Superdoctor');
INSERT INTO prm_role (role_id, role_name) VALUES (8, 'Technician');
INSERT INTO prm_role (role_id, role_name) VALUES (9, 'Nurse');
INSERT INTO prm_role (role_id, role_name) VALUES (10, 'SuperNurse');

INSERT INTO prm_scope (scope_id, scope_name) VALUES (1, 'All');
INSERT INTO prm_scope (scope_id, scope_name) VALUES (2, 'PrmClient');
INSERT INTO prm_scope (scope_id, scope_name) VALUES (3, 'Self');
INSERT INTO prm_scope (scope_id, scope_name) VALUES (4, 'Self&LinkedUsers');

INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (11, 'Home', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (12, 'Home', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (13, 'Home', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (14, 'Home', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (21, 'Call Center Dashboard', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (22, 'Call Center Dashboard', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (23, 'Call Center Dashboard', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (24, 'Call Center Dashboard', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (31, 'Calendar', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (32, 'Calendar', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (33, 'Calendar', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (34, 'Calendar', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (41, 'Patients', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (42, 'Patients', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (43, 'Patients', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (44, 'Patients', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (51, 'Documents', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (52, 'Documents', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (53, 'Documents', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (54, 'Documents', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (61, 'Offers', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (62, 'Offers', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (63, 'Offers', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (64, 'Offers', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (71, 'Invoices', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (72, 'Invoices', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (73, 'Invoices', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (74, 'Invoices', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (81, 'Advance Payments', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (82, 'Advance Payments', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (83, 'Advance Payments', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (84, 'Advance Payments', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (91, 'Assignments', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (92, 'Assignments', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (93, 'Assignments', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (94, 'Assignments', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (101, 'Statistics', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (102, 'Statistics', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (103, 'Statistics', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (104, 'Statistics', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (111, 'Statistics For Clinic', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (112, 'Statistics For Clinic', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (113, 'Statistics For Clinic', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (114, 'Statistics For Clinic', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (121, 'Personal Statistics', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (122, 'Personal Statistics', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (123, 'Personal Statistics', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (124, 'Personal Statistics', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (131, 'Reporting', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (132, 'Reporting', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (133, 'Reporting', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (134, 'Reporting', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (141, 'Emazing', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (142, 'Emazing', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (143, 'Emazing', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (144, 'Emazing', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (151, 'Doctor', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (152, 'Doctor', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (153, 'Doctor', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (154, 'Doctor', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (161, 'Tax Authority', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (162, 'Tax Authority', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (163, 'Tax Authority', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (164, 'Tax Authority', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (171, 'Call Center', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (172, 'Call Center', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (173, 'Call Center', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (174, 'Call Center', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (181, 'Leads', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (182, 'Leads', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (183, 'Leads', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (184, 'Leads', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (191, 'Client Info', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (192, 'Client Info', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (193, 'Client Info', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (194, 'Client Info', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (201, 'KPIs', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (202, 'KPIs', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (203, 'KPIs', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (204, 'KPIs', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (211, 'Work Report', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (212, 'Work Report', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (213, 'Work Report', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (214, 'Work Report', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (221, 'Activity Report', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (222, 'Activity Report', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (223, 'Activity Report', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (224, 'Activity Report', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (231, 'Missing Services', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (232, 'Missing Services', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (233, 'Missing Services', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (234, 'Missing Services', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (241, 'Settings', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (242, 'Settings', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (243, 'Settings', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (244, 'Settings', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (251, 'Free Slots', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (252, 'Free Slots', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (253, 'Free Slots', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (254, 'Free Slots', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (261, 'Users', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (262, 'Users', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (263, 'Users', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (264, 'Users', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (271, 'Locations', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (272, 'Locations', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (273, 'Locations', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (274, 'Locations', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (281, 'Services and Products', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (282, 'Services and Products', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (283, 'Services and Products', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (284, 'Services and Products', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (291, 'Business Customers', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (292, 'Business Customers', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (293, 'Business Customers', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (294, 'Business Customers', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (301, 'Invoicing', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (302, 'Invoicing', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (303, 'Invoicing', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (304, 'Invoicing', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (311, 'SMS Templates', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (312, 'SMS Templates', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (313, 'SMS Templates', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (314, 'SMS Templates', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (321, 'Mail Templates', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (322, 'Mail Templates', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (323, 'Mail Templates', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (324, 'Mail Templates', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (331, 'Advertising', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (332, 'Advertising', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (333, 'Advertising', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (334, 'Advertising', 4);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (341, 'Labels', 1);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (342, 'Labels', 2);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (343, 'Labels', 3);
INSERT INTO prm_permission (permission_id, resource_name, scope_id) VALUES (344, 'Labels', 4);
-- Manager
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (101, 1, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (103, 1, 32);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (104, 1, 42);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (105, 1, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (106, 1, 62);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (107, 1, 72);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (108, 1, 82);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (109, 1, 92);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (110, 1, 101);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (111, 1, 112);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (112, 1, 122);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (113, 1, 131);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (114, 1, 142);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (115, 1, 152);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (116, 1, 162);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (124, 1, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (125, 1, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (126, 1, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (127, 1, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (128, 1, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (129, 1, 292);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (130, 1, 302);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (134, 1, 342);
-- Admin
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (201, 2, 13);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (224, 2, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (226, 2, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (227, 2, 271);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (228, 2, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (229, 2, 292);
-- Administrator
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (301, 3, 13);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (303, 3, 32);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (305, 3, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (306, 3, 62);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (307, 3, 72);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (308, 3, 82);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (309, 3, 93);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (310, 3, 101);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (311, 3, 112);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (313, 3, 131);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (314, 3, 142);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (316, 3, 162);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (324, 3, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (326, 3, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (327, 3, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (328, 3, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (329, 3, 292);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (330, 3, 302);
-- Caller
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (401, 4, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (402, 4, 22);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (403, 4, 32);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (404, 4, 42);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (409, 4, 93);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (417, 4, 171);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (418, 4, 182);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (419, 4, 192);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (420, 4, 202);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (421, 4, 212);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (422, 4, 222);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (423, 4, 232);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (424, 4, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (425, 4, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (426, 4, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (427, 4, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (428, 4, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (431, 4, 312);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (432, 4, 322);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (433, 4, 332);
-- SuperCaller
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (501, 5, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (502, 5, 22);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (503, 5, 32);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (504, 5, 42);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (505, 5, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (506, 5, 62);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (507, 5, 72);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (508, 5, 82);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (509, 5, 92);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (510, 5, 101);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (511, 5, 112);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (512, 5, 122);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (513, 5, 131);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (514, 5, 142);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (517, 5, 171);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (518, 5, 182);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (519, 5, 192);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (520, 5, 202);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (521, 5, 212);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (522, 5, 222);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (523, 5, 232);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (524, 5, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (525, 5, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (526, 5, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (527, 5, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (528, 5, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (531, 5, 312);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (532, 5, 322);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (533, 5, 332);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (534, 5, 342);
-- Doctor
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (601, 6, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (603, 6, 33);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (604, 6, 42);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (605, 6, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (606, 6, 63);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (607, 6, 73);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (608, 6, 83);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (609, 4, 93);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (612, 6, 122);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (615, 6, 153);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (624, 6, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (626, 6, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (625, 6, 262);
-- SuperDoctor
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (701, 7, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (703, 7, 34);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (704, 7, 44);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (705, 7, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (706, 7, 64);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (707, 7, 74);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (708, 7, 84);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (709, 7, 94);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (710, 7, 101);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (711, 7, 112);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (712, 7, 124);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (713, 7, 131);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (714, 7, 142);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (715, 7, 154);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (724, 7, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (725, 7, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (726, 7, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (727, 7, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (728, 7, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (729, 7, 292);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (734, 7, 342);
-- Technician
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (801, 8, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (809, 8, 94);
-- Nurse
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (901, 9, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (903, 9, 34);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (904, 9, 44);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (905, 9, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (906, 9, 64);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (907, 9, 74);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (908, 9, 84);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (909, 9, 94);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (924, 9, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (925, 9, 252);
-- SuperNurse
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1001, 10, 12);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1003, 10, 32);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1004, 10, 42);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1005, 10, 51);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1006, 10, 62);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1007, 10, 72);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1008, 10, 82);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1009, 10, 94);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1010, 10, 101);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1011, 10, 112);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1013, 10, 131);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1014, 10, 142);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1016, 10, 162);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1024, 10, 241);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1025, 10, 252);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1026, 10, 262);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1027, 10, 272);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1028, 10, 282);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1029, 10, 292);
INSERT INTO prm_role_permission (role_permission_id, role_id, permission_id) VALUES (1034, 10, 342);


--############################################################
--# update version
--############################################################
UPDATE db_version SET version ='01.16', version_date=CURRENT_DATE WHERE resource='Tables';


COMMIT;
