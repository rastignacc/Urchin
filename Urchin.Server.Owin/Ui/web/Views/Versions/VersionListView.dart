import 'dart:html';

import '../../MVVM/View.dart';
import '../../MVVM/BoundList.dart';

import '../../Events/AppEvents.dart';

import '../../Models/VersionModel.dart';

import '../../Events/AppEvents.dart';

import '../../ViewModels/VersionViewModel.dart';
import '../../ViewModels/VersionListViewModel.dart';

import '../../Views/Versions/VersionListElementView.dart';

class VersionListView extends View
{
	BoundList<VersionModel, VersionViewModel, VersionListElementView> _versionsBinding;

	VersionListView([VersionListViewModel viewModel])
	{
		addHeading(3, 'Versions');

		_versionsBinding = new BoundList<VersionModel, VersionViewModel, VersionListElementView>(
			(vm) => new VersionListElementView(vm), 
			addList(),
			selectionMethod: (vm) => AppEvents.versionSelected.raise(new VersionSelectedEvent(vm)));

		var buttonBar = addContainer(className: 'button-bar');
		addButton("Save", _saveClicked, parent: buttonBar);
		addButton("Discard", _discardClicked, parent: buttonBar);

		this.viewModel = viewModel;
	}

	void _saveClicked(MouseEvent e)
	{
		//viewModel.save();
	}

	void _discardClicked(MouseEvent e)
	{
		//viewModel.reload();
	}

	VersionListViewModel _viewModel;
	VersionListViewModel get viewModel => _viewModel;

	void set viewModel(VersionListViewModel value)
	{
		_viewModel = value;
		if (value == null)
		{
			_versionsBinding.binding = null;
		}
		else
		{
			_versionsBinding.binding = value.versions;
		}
	}  
}