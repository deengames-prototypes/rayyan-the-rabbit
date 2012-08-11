import massive.munit.TestSuite;

import com.blastcube.controls.ThreeScaleButtonTest;
import com.blastcube.core.exception.ExceptionTest;
import com.blastcube.core.GameTest;
import com.blastcube.core.ScreenTest;
import com.blastcube.extensions.StringExtensionsTest;
import com.blastcube.extensions.TextFieldExtensionsTest;
import com.deengames.rayyantherabbit.screen.TitleScreenTest;

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
		add(com.deengames.rayyantherabbit.screen.TitleScreenTest);
	}
}
