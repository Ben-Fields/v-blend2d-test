module blend2d

#flag -D BL_STATIC

#flag -L @VROOT/build
#flag -L @VROOT/build/Release
#flag -lblend2d

#flag -I @VROOT/c/src
#include "blend2d.h"



/* V wrapper for the Blend2D C API.
 *
 */

type BLResult = u32

struct C.BLImageCore {
}
pub type Image = C.BLImageCore
fn C.blImageInitAs(self &C.BLImageCore, w int, h int, format Format) BLResult
pub fn new_image(w int, h int, format Format) Image {
	img := C.BLImageCore{}
	C.blImageInitAs(&img, w, h, format)
	return img
}

pub enum Format {
	@none				// None or invalid pixel format.
	prgb32				// 32-bit premultiplied ARGB pixel format (8-bit components).
	xrgb32				// 32-bit (X)RGB pixel format (8-bit components, alpha ignored).
	a8					// 8-bit alpha-only pixel format.
	count				// Count of pixel formats.
	reserved_count		// Count of pixel formats (reserved for future use).
}

// fn C.blImageDestroy(self &C.BLImageCore) BLResult
// pub fn (img Image) destroy() {
// 	C.blImageDestroy(img)
// }


// struct C.BLImageCodecCore {
// }
// pub type ImageCodec = C.BLImageCodecCore

// fn C.blImageCodecFindByName(mut self &C.BLImageCodecCore, name charptr, size size_t, codecs &C.BLArrayCore) BLResult
// pub fn (self ImageCodec) find_by_name(name string) {
// 	C.blImageCodecFindByName(self, charptr(&name), sizeof(name), 0)
// }

// fn C.blImageWriteToFile(self &C.BLImageCore, filename charptr, codec &C.BLImageCodecCore) BLResult
// pub fn (img Image) write_to_file(filename string, codec ImageCodec) {
// 	C.blImageWriteToFile(img, charptr(&filename), codec)
// }
