import massive.munit.TestSuite;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.exception.ExceptionTest;
import com.blastcube.core.GameTest;
import com.blastcube.core.ScreenTest;
import com.blastcube.extensions.StringExtensionsTest;
import com.blastcube.extensions.TextFieldExtensionsTest;
import com.deengames.gamebook.model.ProjectTest;
import com.deengames.gamebook.persistance.PersisterV1Test;
import com.deengames.gamebook.screen.ShowScenesScreenTest;
import com.deengames.gamebook.screen.TitleScreenTest;
import ExampleTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(com.blastcube.controls.ThreeScaleButtonTest);
		add(com.blastcube.core.exception.ExceptionTest);
		add(com.blastcube.core.GameTest);
		add(com.blastcube.core.ScreenTest);
		add(com.blastcube.extensions.StringExtensionsTest);
		add(com.blastcube.extensions.TextFieldExtensionsTest);
		add(com.deengames.gamebook.model.ProjectTest);
		add(com.deengames.gamebook.persistance.PersisterV1Test);
		add(com.deengames.gamebook.screen.ShowScenesScreenTest);
		add(com.deengames.gamebook.screen.TitleScreenTest);
		add(ExampleTest);
	}
}
