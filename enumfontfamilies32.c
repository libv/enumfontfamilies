/*
 * Copyright (c) 2025 Luc Verhaegen <libv@skynet.be>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
#include <stdio.h>
#include <windows.h>

/*
 *
 */
static int CALLBACK
font_enum_proc(const LOGFONTA *logfont, const TEXTMETRICA *metric,
	       DWORD type, LPARAM param)
{
	printf("Font \"%s\"\n", logfont->lfFaceName);

	return 1;
}

/*
 *
 */
int PASCAL
WinMain(HINSTANCE instance, HINSTANCE instance_previous,
	LPSTR command_line, int show)
{
	HDC handle = CreateCompatibleDC(0);
	int numfonts = GetDeviceCaps(handle, NUMFONTS);

	printf("%d fonts\n", numfonts);

	EnumFontFamilies(handle, NULL, font_enum_proc, 0);

	DeleteDC(handle);

	return 0;
}
