import 'dart:html';
import 'dart:convert';
import 'dart:async';

import 'Data.dart';
import 'ApplicationEvents.dart';

import 'Components/RuleListComponent.dart';
import 'Components/ToolBarComponent.dart';
import 'Components/RuleDetailComponent.dart';
import 'Components/EnvironmentListComponent.dart';
import 'Components/EnvironmentDetailComponent.dart';
import 'Components/TestQueryComponent.dart';
import 'Components/LogonComponent.dart';
import 'Components/HelpComponent.dart';

Data data;

RuleListComponent _ruleListComponent;
RuleDetailComponent _ruleDetailComponent;
EnvironmentListComponent _environmentListComponent;
EnvironmentDetailComponent _environmentDetailComponent;
TestQueryComponent _testQueryComponent;
LogonComponent _logonComponent;
ToolBarComponent _toolBarComponent;
HelpComponent _helpComponent;

Element _leftDiv;
Element _centreDiv;
Element _rightDiv;
Element _userDiv;
Element _toolBarDiv;

main() async
{ 
	data = new Data();
	_setupUI();
}

void _setupUI()
{
	_leftDiv = querySelector('#leftDiv');
	_centreDiv = querySelector('#centreDiv');
	_rightDiv = querySelector('#rightDiv');
	_userDiv = querySelector('#userDiv');
	_toolBarDiv = querySelector('#toolBarDiv');

	_ruleListComponent = new RuleListComponent(data);
	_ruleDetailComponent = new RuleDetailComponent(data);
	_environmentListComponent = new EnvironmentListComponent(data);
	_environmentDetailComponent = new EnvironmentDetailComponent(data);
	_testQueryComponent = new TestQueryComponent();
	_logonComponent = new LogonComponent(data);
	_toolBarComponent = new ToolBarComponent();
	_helpComponent = new HelpComponent();

	_logonComponent.displayIn(_userDiv);
	_toolBarComponent.displayIn(_toolBarDiv);
	_helpComponent.displayIn(_rightDiv);

	_setupRulesTab();

	ApplicationEvents.onTabChanged.listen(_tabChanged);
}

void _tabChanged(TabChangedEvent e)
{
	if (e.tabName == 'Rules') _setupRulesTab();
	if (e.tabName == 'Environments') _setupEnvironmentsTab();
	if (e.tabName == 'Test Query') _setupTestTab();
	if (e.tabName == 'Versions') _setupVersionsTab();
}

void _clearUI()
{
	_leftDiv.children.clear(); 
	_centreDiv.children.clear(); 
}

void _setupRulesTab()
{
	_clearUI(); 

	_ruleListComponent.displayIn(_leftDiv);
	_ruleDetailComponent.displayIn(_centreDiv);
}

void _setupEnvironmentsTab()
{
	_clearUI(); 

	_environmentListComponent.displayIn(_leftDiv);
	_environmentDetailComponent.displayIn(_centreDiv);
}

void _setupTestTab()
{
	_clearUI(); 

	_testQueryComponent.displayIn(_centreDiv);
}

void _setupVersionsTab()
{
	_clearUI(); 
}

