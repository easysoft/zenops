SET NAMES utf8;
INSERT INTO `zt_company` (`name`, `admins`) VALUES('易软天创', ',admin,');
INSERT INTO `zt_user` (`account`, `password`, `realname`, `gender`) VALUES('admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'f');
INSERT INTO `zt_config` (`owner`, `module`, `section`, `key`, `value`) VALUES ('system', 'common', 'global', 'flow', 'full');
INSERT INTO `zt_config` (`owner`, `module`, `section`, `key`, `value`) VALUES ('system', 'common', 'global', 'cron', '1');
INSERT INTO `zt_config` (`owner`, `module`, `section`, `key`, `value`) VALUES ('system', 'common', 'safe', 'mode', '1');
INSERT INTO `zt_config` (`owner`, `module`, `section`, `key`, `value`) VALUES ('system', 'common', 'safe', 'changeWeak', '1');

UPDATE `zt_group` set `name` = '管理员',   `desc` = '系统管理员' where `role` = 'admin';
UPDATE `zt_group` set `name` = '研发',     `desc` = '研发人员' where `role` = 'dev';
UPDATE `zt_group` set `name` = '测试',     `desc` = '测试人员' where `role` = 'qa';
UPDATE `zt_group` set `name` = '项目经理', `desc` = '项目经理' where `role` = 'pm';
UPDATE `zt_group` set `name` = '产品经理', `desc` = '产品经理' where `role` = 'po';
UPDATE `zt_group` set `name` = '研发主管', `desc` = '研发主管' where `role` = 'td';
UPDATE `zt_group` set `name` = '产品主管', `desc` = '产品主管' where `role` = 'pd';
UPDATE `zt_group` set `name` = '测试主管', `desc` = '测试主管' where `role` = 'qd';
UPDATE `zt_group` set `name` = '高层管理', `desc` = '高层管理' where `role` = 'top';
UPDATE `zt_group` set `name` = '其他',     `desc` = '其他' where `role` = 'others';
UPDATE `zt_group` set `name` = '受限用户', `desc` = '受限用户分组(只能编辑与自己相关的内容)' where `role` = 'limited';

UPDATE `zt_cron` SET `remark` = '监控定时任务' where `command` = '';
UPDATE `zt_cron` SET `remark` = '更新燃尽图' where `command` = 'moduleName=project&methodName=computeburn';
UPDATE `zt_cron` SET `remark` = '每日任务提醒' where `command` = 'moduleName=report&methodName=remind';
UPDATE `zt_cron` SET `remark` = '同步SVN' where `command` = 'moduleName=svn&methodName=run';
UPDATE `zt_cron` SET `remark` = '同步GIT' where `command` = 'moduleName=git&methodName=run';
UPDATE `zt_cron` SET `remark` = '备份数据和附件' where `command` = 'moduleName=backup&methodName=backup';
UPDATE `zt_cron` SET `remark` = '异步发信' where `command` = 'moduleName=mail&methodName=asyncSend';
UPDATE `zt_cron` SET `remark` = '异步发送Webhook' where `command` = 'moduleName=webhook&methodName=asyncSend';
UPDATE `zt_cron` SET `remark` = '删除过期日志' where `command` = 'moduleName=admin&methodName=deleteLog';
UPDATE `zt_cron` SET `remark` = '生成周期性待办' where `command` = 'moduleName=todo&methodName=createCycle';

