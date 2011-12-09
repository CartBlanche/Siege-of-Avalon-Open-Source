unit DirectX;
{******************************************************************************}
{                                                                              }
{               Siege Of Avalon : Open Source Edition                          }
{               -------------------------------------                          }
{                                                                              }
{ Portions created by Digital Tome L.P. Texas USA are                          }
{ Copyright �1999-2000 Digital Tome L.P. Texas USA                             }
{ All Rights Reserved.                                                         }
{                                                                              }
{ Portions created by Team SOAOS are                                           }
{ Copyright (C) 2003 - Team SOAOS.                                             }
{                                                                              }
{                                                                              }
{ Contributor(s)                                                               }
{ --------------                                                               }
{ Dominique Louis <Dominique@SavageSoftware.com.au>                            }
{                                                                              }
{                                                                              }
{                                                                              }
{ You may retrieve the latest version of this file at the SOAOS project page : }
{   http://www.sourceforge.com/projects/soaos                                  }
{                                                                              }
{ The contents of this file maybe used with permission, subject to             }
{ the GNU Lesser General Public License Version 2.1 (the "License"); you may   }
{ not use this file except in compliance with the License. You may             }
{ obtain a copy of the License at                                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Software distributed under the License is distributed on an                  }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or               }
{ implied. See the License for the specific language governing                 }
{ rights and limitations under the License.                                    }
{                                                                              }
{ Description                                                                  }
{ -----------                                                                  }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{ Requires                                                                     }
{ --------                                                                     }
{   DirectX Runtime libraris on Win32                                          }
{   They are available from...                                                 }
{   http://www.microsoft.com.                                                  }
{                                                                              }
{ Programming Notes                                                            }
{ -----------------                                                            }
{                                                                              }
{                                                                              }
{                                                                              }
{                                                                              }
{ Revision History                                                             }
{ ----------------                                                             }
{   July    13 2003 - DL : Initial Upload to CVS                               }
{                                                                              }
{******************************************************************************}
(*==========================================================================;
 *
 *  DirectX header version 98.08.07
 *
 *  Present by Hiroyuki Hori.
 *
 *  E-Mail: hori@ingjapan.ne.jp
 *  Homepage: http://www.ingjapan.ne.jp/hori/index-e.html
 *
 *  Present unit:
 *    DirectX.pas    DirectX 6 (DirectX 6 SDK)
 *    DShow.pas      DirectShow (DirectX Media SDK 5.1)
 *    DAnim.pas      DirectAnimation (DirectX Media SDK 5.1)
 *
 ***************************************************************************)

interface

{$Z4}
{$A+}
{$WEAKPACKAGEUNIT}

{$IFNDEF DirectX3}
{$IFNDEF DirectX5}
{$IFNDEF DirectX6}
  {$DEFINE DirectX6}
{$ENDIF}
{$ENDIF}
{$ENDIF}

{$IFDEF DirectX3}
  {$UNDEF DirectX1}
  {$UNDEF DirectX2}
  {$UNDEF DirectX4}
  {$UNDEF DirectX5}
  {$UNDEF DirectX6}
  {$DEFINE OlderThanDirectX5}
{$ENDIF}

{$IFDEF DirectX5}
  {$UNDEF DirectX1}
  {$UNDEF DirectX2}
  {$UNDEF DirectX3}
  {$UNDEF DirectX4}
  {$UNDEF DirectX6}
{$ENDIF}

{$IFDEF DirectX6}
  {$UNDEF DirectX1}
  {$UNDEF DirectX2}
  {$UNDEF DirectX3}
  {$UNDEF DirectX4}
  {$UNDEF DirectX5}
{$ENDIF}

uses Windows, MMSystem;

(*==========================================================================;
 *
 *  Copyright (C) Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       ddraw.h
 *  Content:    DirectDraw include file
 *
 ***************************************************************************)

{ FOURCC codes for DX compressed-texture pixel formats }

const
  FOURCC_DXT1 = Ord('D') + Ord('X') shl 8 + Ord('T') shl 16 + Ord('1') shl 24;
  FOURCC_DXT2 = Ord('D') + Ord('X') shl 8 + Ord('T') shl 16 + Ord('2') shl 24;
  FOURCC_DXT3 = Ord('D') + Ord('X') shl 8 + Ord('T') shl 16 + Ord('3') shl 24;
  FOURCC_DXT4 = Ord('D') + Ord('X') shl 8 + Ord('T') shl 16 + Ord('4') shl 24;
  FOURCC_DXT5 = Ord('D') + Ord('X') shl 8 + Ord('T') shl 16 + Ord('5') shl 24;

{ GUIDS used by DirectDraw objects }

const
  CLSID_DirectDraw: TGUID = '{D7B70EE0-4340-11CF-B063-0020AFC2CD35}';
  CLSID_DirectDrawClipper: TGUID = '{593817A0-7DB3-11CF-A2DE-00AA00B93356}';
  IID_IDirectDraw: TGUID = '{6C14DB80-A733-11CE-A521-0020AF0BE560}';
  IID_IDirectDraw2: TGUID = '{B3A6F3E0-2B43-11CF-A2DE-00AA00B93356}';
  IID_IDirectDraw4: TGUID = '{9C59509A-39BD-11D1-8C4A-00C04FD930C5}';
  IID_IDirectDrawSurface: TGUID = '{6C14DB81-A733-11CE-A521-0020AF0BE560}';
  IID_IDirectDrawSurface2: TGUID = '{57805885-6EEC-11CF-9441-A82303C10E27}';
  IID_IDirectDrawSurface3: TGUID = '{DA044E00-69B2-11D0-A1D5-00AA00B8DFBB}';
  IID_IDirectDrawSurface4: TGUID = '{0B2B8630-AD35-11D0-8EA6-00609797EA5B}';
  IID_IDirectDrawPalette: TGUID = '{6C14DB84-A733-11CE-A521-0020AF0BE560}';
  IID_IDirectDrawClipper: TGUID = '{6C14DB85-A733-11CE-A521-0020AF0BE560}';
  IID_IDirectDrawColorControl: TGUID = '{4B9F0EE0-0D7E-11D0-9B06-00A0C903A3B8}';
  IID_IDirectDrawGammaControl: TGUID = '{69C11C3E-B46B-11D1-AD7A-00C04FC29B4E}';

const
  DD_ROP_SPACE = 256 div 32;       // space required to store ROP array

  MAX_DDDEVICEID_STRING = 512;

{ DirectDraw Structures }

type
  IDirectDraw = interface;
  IDirectDraw2 = interface;
  IDirectDraw4 = interface;
  IDirectDrawSurface = interface;
  IDirectDrawSurface2 = interface;
  IDirectDrawSurface3 = interface;
  IDirectDrawSurface4 = interface;
  IDirectDrawPalette = interface;
  IDirectDrawClipper = interface;
  IDirectDrawColorControl = interface;
  IDirectDrawGammaControl = interface;

{ TDDRGBA structure }

  PDDRGBA = ^TDDRGBA;
  TDDRGBA = record
    Red: Byte;
    Green: Byte;
    Blue: Byte;
    Alpha: Byte;
  end;

  DDRGBA = TDDRGBA;
  LPDDRGBA = PDDRGBA;

{ TDDColorKey structure }

  PDDColorKey = ^TDDColorKey;
  TDDColorKey = record
    dwColorSpaceLowValue: DWORD;   // low boundary of color space that is to
                                   //  be treated as Color Key, inclusive
    dwColorSpaceHighValue: DWORD;  // high boundary of color space that is
                                   //  to be treated as Color Key, inclusive
  end;

  DDCOLORKEY = TDDColorKey;
  LPDDCOLORKEY = PDDColorKey;

{ TDDBltFX structure }

  PDDBltFX = ^TDDBltFX;
  TDDBltFX = record
    dwSize: DWORD;                           // size of structure
    dwDDFX: DWORD;                           // FX operations
    dwROP: DWORD;                            // Win32 raster operations
    dwDDROP: DWORD;                          // Raster operations new for DirectDraw
    dwRotationAngle: DWORD;                  // Rotation angle for blt
    dwZBufferOpCode: DWORD;                  // ZBuffer compares
    dwZBufferLow: DWORD;                     // Low limit of Z buffer
    dwZBufferHigh: DWORD;                    // High limit of Z buffer
    dwZBufferBaseDest: DWORD;                // Destination base value
    dwZDestConstBitDepth: DWORD;             // Bit depth used to specify Z constant for destination
    case Integer of
    0: (
      dwZDestConst: DWORD;                   // Constant to use as Z buffer for dest
      dwZSrcConstBitDepth: DWORD;            // Bit depth used to specify Z constant for source
      dwZSrcConst: DWORD;                    // Constant to use as Z buffer for src
      dwAlphaEdgeBlendBitDepth: DWORD;       // Bit depth used to specify constant for alpha edge blend
      dwAlphaEdgeBlend: DWORD;               // Alpha for edge blending
      dwReserved: DWORD;
      dwAlphaDestConstBitDepth: DWORD;       // Bit depth used to specify alpha constant for destination
      dwAlphaDestConst: DWORD;               // Constant to use as Alpha Channel
      dwAlphaSrcConstBitDepth: DWORD;        // Bit depth used to specify alpha constant for source
      dwAlphaSrcConst: DWORD;                // Constant to use as Alpha Channel
      dwFillColor: DWORD;                    // color in RGB or Palettized
      ddckDestColorkey: TDDColorKey;          // DestColorkey override
      ddckSrcColorkey: TDDColorKey;           // SrcColorkey override
      );
    1: (
      lpDDSZBufferDest: IDirectDrawSurface;  // Surface to use as Z buffer for dest
      _union1b: DWORD;
      lpDDSZBufferSrc: IDirectDrawSurface;   // Surface to use as Z buffer for src
      _union1d: DWORD;
      _union1e: DWORD;
      _union1f: DWORD;
      _union1g: DWORD;
      lpDDSAlphaDest: IDirectDrawSurface;    // Surface to use as Alpha Channel
      _union1i: DWORD;
      lpDDSAlphaSrc: IDirectDrawSurface;     // Surface to use as Alpha Channel
      dwFillDepth: DWORD;                    // depth value for z-buffer
      );
    2: (
      _union2a: DWORD;
      _union2b: DWORD;
      _union2c: DWORD;
      _union2d: DWORD;
      _union2e: DWORD;
      _union2f: DWORD;
      _union2g: DWORD;
      _union2h: DWORD;
      _union2i: DWORD;
      _union2j: DWORD;
      lpDDSPattern: IDirectDrawSurface;       // Surface to use as pattern
      );
  end;

  DDBLTFX = TDDBltFX;
  LPDDBLTFX = PDDBltFX;

{ TDDSCaps structure }

  PDDSCaps = ^TDDSCaps;
  TDDSCaps = record
    dwCaps: DWORD;         // capabilities of surface wanted
  end;

  DDSCAPS = TDDSCaps;
  LPDDSCAPS = PDDSCaps;
{ TDDOSCaps structure }

  PDDOSCaps = ^TDDOSCaps;
  TDDOSCaps = record
    dwCaps: DWORD;         // capabilities of surface wanted
  end;

  DDOSCAPS = TDDOSCaps;
  LPDDOSCAPS = PDDOSCaps;


{ TDDSCapsEx structure }

  PDDSCapsEx = ^TDDSCapsEx;
  TDDSCapsEx = record
    dwCaps2: DWORD;
    dwCaps3: DWORD;
    dwCaps4: DWORD;
  end;

  DDSCAPSEX = TDDSCapsEx;
  LPDDSCAPSEX = PDDSCapsEx;

{ TDDSCaps2 structure }

  PDDSCaps2 = ^TDDSCaps2;
  TDDSCaps2 = record
    dwCaps: DWORD;         // capabilities of surface wanted
    dwCaps2: DWORD;
    dwCaps3: DWORD;
    dwCaps4: DWORD;
  end;

  DDSCAPS2 = TDDSCaps2;
  LPDDSCAPS2 = PDDSCaps2;

{ TDDCaps structure }

  PDDCaps_DX3 = ^TDDCaps_DX3;
  TDDCaps_DX3 = record
    dwSize: DWORD;                 // size of the DDDRIVERCAPS structure
    dwCaps: DWORD;                 // driver specific capabilities
    dwCaps2: DWORD;                // more driver specific capabilites
    dwCKeyCaps: DWORD;             // color key capabilities of the surface
    dwFXCaps: DWORD;               // driver specific stretching and effects capabilites
    dwFXAlphaCaps: DWORD;          // alpha driver specific capabilities
    dwPalCaps: DWORD;              // palette capabilities
    dwSVCaps: DWORD;               // stereo vision capabilities
    dwAlphaBltConstBitDepths: DWORD;       // DDBD_2,4,8
    dwAlphaBltPixelBitDepths: DWORD;       // DDBD_1,2,4,8
    dwAlphaBltSurfaceBitDepths: DWORD;     // DDBD_1,2,4,8
    dwAlphaOverlayConstBitDepths: DWORD;   // DDBD_2,4,8
    dwAlphaOverlayPixelBitDepths: DWORD;   // DDBD_1,2,4,8
    dwAlphaOverlaySurfaceBitDepths: DWORD; // DDBD_1,2,4,8
    dwZBufferBitDepths: DWORD;             // DDBD_8,16,24,32
    dwVidMemTotal: DWORD;          // total amount of video memory
    dwVidMemFree: DWORD;           // amount of free video memory
    dwMaxVisibleOverlays: DWORD;   // maximum number of visible overlays
    dwCurrVisibleOverlays: DWORD;  // current number of visible overlays
    dwNumFourCCCodes: DWORD;       // number of four cc codes
    dwAlignBoundarySrc: DWORD;     // source rectangle alignment
    dwAlignSizeSrc: DWORD;         // source rectangle byte size
    dwAlignBoundaryDest: DWORD;    // dest rectangle alignment
    dwAlignSizeDest: DWORD;        // dest rectangle byte size
    dwAlignStrideAlign: DWORD;     // stride alignment
    dwRops: array[0..DD_ROP_SPACE-1] of DWORD;   // ROPS supported
    ddsCaps: TDDSCaps;             // TDDSCaps structure has all the general capabilities
    dwMinOverlayStretch: DWORD;    // minimum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxOverlayStretch: DWORD;    // maximum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinLiveVideoStretch: DWORD;  // minimum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxLiveVideoStretch: DWORD;  // maximum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinHwCodecStretch: DWORD;    // minimum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxHwCodecStretch: DWORD;    // maximum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwReserved1: DWORD;            // reserved
    dwReserved2: DWORD;            // reserved
    dwReserved3: DWORD;            // reserved
    dwSVBCaps: DWORD;              // driver specific capabilities for System->Vmem blts
    dwSVBCKeyCaps: DWORD;          // driver color key capabilities for System->Vmem blts
    dwSVBFXCaps: DWORD;            // driver FX capabilities for System->Vmem blts
    dwSVBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->Vmem blts
    dwVSBCaps: DWORD;              // driver specific capabilities for Vmem->System blts
    dwVSBCKeyCaps: DWORD;          // driver color key capabilities for Vmem->System blts
    dwVSBFXCaps: DWORD;            // driver FX capabilities for Vmem->System blts
    dwVSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for Vmem->System blts
    dwSSBCaps: DWORD;              // driver specific capabilities for System->System blts
    dwSSBCKeyCaps: DWORD;          // driver color key capabilities for System->System blts
    dwSSBFXCaps: DWORD;            // driver FX capabilities for System->System blts
    dwSSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->System blts
    dwReserved4: DWORD;            // reserved
    dwReserved5: DWORD;            // reserved
    dwReserved6: DWORD;            // reserved
  end;

  PDDCaps_DX5 = ^TDDCaps_DX5;
  TDDCaps_DX5 = record
    dwSize: DWORD;                 // size of the DDDRIVERCAPS structure
    dwCaps: DWORD;                 // driver specific capabilities
    dwCaps2: DWORD;                // more driver specific capabilites
    dwCKeyCaps: DWORD;             // color key capabilities of the surface
    dwFXCaps: DWORD;               // driver specific stretching and effects capabilites
    dwFXAlphaCaps: DWORD;          // alpha driver specific capabilities
    dwPalCaps: DWORD;              // palette capabilities
    dwSVCaps: DWORD;               // stereo vision capabilities
    dwAlphaBltConstBitDepths: DWORD;       // DDBD_2,4,8
    dwAlphaBltPixelBitDepths: DWORD;       // DDBD_1,2,4,8
    dwAlphaBltSurfaceBitDepths: DWORD;     // DDBD_1,2,4,8
    dwAlphaOverlayConstBitDepths: DWORD;   // DDBD_2,4,8
    dwAlphaOverlayPixelBitDepths: DWORD;   // DDBD_1,2,4,8
    dwAlphaOverlaySurfaceBitDepths: DWORD; // DDBD_1,2,4,8
    dwZBufferBitDepths: DWORD;             // DDBD_8,16,24,32
    dwVidMemTotal: DWORD;          // total amount of video memory
    dwVidMemFree: DWORD;           // amount of free video memory
    dwMaxVisibleOverlays: DWORD;   // maximum number of visible overlays
    dwCurrVisibleOverlays: DWORD;  // current number of visible overlays
    dwNumFourCCCodes: DWORD;       // number of four cc codes
    dwAlignBoundarySrc: DWORD;     // source rectangle alignment
    dwAlignSizeSrc: DWORD;         // source rectangle byte size
    dwAlignBoundaryDest: DWORD;    // dest rectangle alignment
    dwAlignSizeDest: DWORD;        // dest rectangle byte size
    dwAlignStrideAlign: DWORD;     // stride alignment
    dwRops: array[0..DD_ROP_SPACE-1] of DWORD;   // ROPS supported
    ddsCaps: TDDSCaps;             // TDDSCaps structure has all the general capabilities
    dwMinOverlayStretch: DWORD;    // minimum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxOverlayStretch: DWORD;    // maximum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinLiveVideoStretch: DWORD;  // minimum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxLiveVideoStretch: DWORD;  // maximum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinHwCodecStretch: DWORD;    // minimum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxHwCodecStretch: DWORD;    // maximum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwReserved1: DWORD;            // reserved
    dwReserved2: DWORD;            // reserved
    dwReserved3: DWORD;            // reserved
    dwSVBCaps: DWORD;              // driver specific capabilities for System->Vmem blts
    dwSVBCKeyCaps: DWORD;          // driver color key capabilities for System->Vmem blts
    dwSVBFXCaps: DWORD;            // driver FX capabilities for System->Vmem blts
    dwSVBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->Vmem blts
    dwVSBCaps: DWORD;              // driver specific capabilities for Vmem->System blts
    dwVSBCKeyCaps: DWORD;          // driver color key capabilities for Vmem->System blts
    dwVSBFXCaps: DWORD;            // driver FX capabilities for Vmem->System blts
    dwVSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for Vmem->System blts
    dwSSBCaps: DWORD;              // driver specific capabilities for System->System blts
    dwSSBCKeyCaps: DWORD;          // driver color key capabilities for System->System blts
    dwSSBFXCaps: DWORD;            // driver FX capabilities for System->System blts
    dwSSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->System blts
    { Members added for DX5 }
    dwMaxVideoPorts: DWORD;        // maximum number of usable video ports
    dwCurrVideoPorts: DWORD;       // current number of video ports used
    dwSVBCaps2: DWORD;             // more driver specific capabilities for System->Vmem blts
    dwNLVBCaps: DWORD;             // driver specific capabilities for non-local->local vidmem blts
    dwNLVBCaps2: DWORD;            // more driver specific capabilities non-local->local vidmem blts
    dwNLVBCKeyCaps: DWORD;         // driver color key capabilities for non-local->local vidmem blts
    dwNLVBFXCaps: DWORD;           // driver FX capabilities for non-local->local blts
    dwNLVBRops: array[0..DD_ROP_SPACE-1] of DWORD; // ROPS supported for non-local->local blts
  end;

  PDDCaps_DX6 = ^TDDCaps_DX6;
  TDDCaps_DX6 = record
    dwSize: DWORD;                 // size of the DDDRIVERCAPS structure
    dwCaps: DWORD;                 // driver specific capabilities
    dwCaps2: DWORD;                // more driver specific capabilites
    dwCKeyCaps: DWORD;             // color key capabilities of the surface
    dwFXCaps: DWORD;               // driver specific stretching and effects capabilites
    dwFXAlphaCaps: DWORD;          // alpha driver specific capabilities
    dwPalCaps: DWORD;              // palette capabilities
    dwSVCaps: DWORD;               // stereo vision capabilities
    dwAlphaBltConstBitDepths: DWORD;       // DDBD_2,4,8
    dwAlphaBltPixelBitDepths: DWORD;       // DDBD_1,2,4,8
    dwAlphaBltSurfaceBitDepths: DWORD;     // DDBD_1,2,4,8
    dwAlphaOverlayConstBitDepths: DWORD;   // DDBD_2,4,8
    dwAlphaOverlayPixelBitDepths: DWORD;   // DDBD_1,2,4,8
    dwAlphaOverlaySurfaceBitDepths: DWORD; // DDBD_1,2,4,8
    dwZBufferBitDepths: DWORD;             // DDBD_8,16,24,32
    dwVidMemTotal: DWORD;          // total amount of video memory
    dwVidMemFree: DWORD;           // amount of free video memory
    dwMaxVisibleOverlays: DWORD;   // maximum number of visible overlays
    dwCurrVisibleOverlays: DWORD;  // current number of visible overlays
    dwNumFourCCCodes: DWORD;       // number of four cc codes
    dwAlignBoundarySrc: DWORD;     // source rectangle alignment
    dwAlignSizeSrc: DWORD;         // source rectangle byte size
    dwAlignBoundaryDest: DWORD;    // dest rectangle alignment
    dwAlignSizeDest: DWORD;        // dest rectangle byte size
    dwAlignStrideAlign: DWORD;     // stride alignment
    dwRops: array[0..DD_ROP_SPACE-1] of DWORD;   // ROPS supported
    ddsOldCaps: TDDSCaps;          // Was TDDSCaps ddsCaps. ddsCaps is of type DDSCAPS2 for DX6
    dwMinOverlayStretch: DWORD;    // minimum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxOverlayStretch: DWORD;    // maximum overlay stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinLiveVideoStretch: DWORD;  // minimum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxLiveVideoStretch: DWORD;  // maximum live video stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMinHwCodecStretch: DWORD;    // minimum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwMaxHwCodecStretch: DWORD;    // maximum hardware codec stretch factor multiplied by 1000, eg 1000 == 1.0, 1300 == 1.3
    dwReserved1: DWORD;            // reserved
    dwReserved2: DWORD;            // reserved
    dwReserved3: DWORD;            // reserved
    dwSVBCaps: DWORD;              // driver specific capabilities for System->Vmem blts
    dwSVBCKeyCaps: DWORD;          // driver color key capabilities for System->Vmem blts
    dwSVBFXCaps: DWORD;            // driver FX capabilities for System->Vmem blts
    dwSVBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->Vmem blts
    dwVSBCaps: DWORD;              // driver specific capabilities for Vmem->System blts
    dwVSBCKeyCaps: DWORD;          // driver color key capabilities for Vmem->System blts
    dwVSBFXCaps: DWORD;            // driver FX capabilities for Vmem->System blts
    dwVSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for Vmem->System blts
    dwSSBCaps: DWORD;              // driver specific capabilities for System->System blts
    dwSSBCKeyCaps: DWORD;          // driver color key capabilities for System->System blts
    dwSSBFXCaps: DWORD;            // driver FX capabilities for System->System blts
    dwSSBRops: array[0..DD_ROP_SPACE-1] of DWORD;// ROPS supported for System->System blts
    { Members added for DX5 }
    dwMaxVideoPorts: DWORD;        // maximum number of usable video ports
    dwCurrVideoPorts: DWORD;       // current number of video ports used
    dwSVBCaps2: DWORD;             // more driver specific capabilities for System->Vmem blts
    dwNLVBCaps: DWORD;             // driver specific capabilities for non-local->local vidmem blts
    dwNLVBCaps2: DWORD;            // more driver specific capabilities non-local->local vidmem blts
    dwNLVBCKeyCaps: DWORD;         // driver color key capabilities for non-local->local vidmem blts
    dwNLVBFXCaps: DWORD;           // driver FX capabilities for non-local->local blts
    dwNLVBRops: array[0..DD_ROP_SPACE-1] of DWORD; // ROPS supported for non-local->local blts
    { Members added for DX6 }
    ddsCaps: TDDSCaps2;            // Surface Caps
  end;

{$IFDEF DirectX3}
  TDDCaps = TDDCaps_DX3;
  PDDCaps = PDDCaps_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDDCaps = TDDCaps_DX5;
  PDDCaps = PDDCaps_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDDCaps = TDDCaps_DX6;
  PDDCaps = PDDCaps_DX6;
{$ENDIF}

  DDCAPS = TDDCaps;
  LPDDCAPS = PDDCaps;

{ TDDPixelFormat structure }

  PDDPixelFormat = ^TDDPixelFormat;
  TDDPixelFormat = record
    dwSize: DWORD;                // size of structure
    dwFlags: DWORD;               // pixel format flags
    dwFourCC: DWORD;              // (FOURCC code)
    case Integer of
      0: (
        dwRGBBitCount: DWORD;          // how many bits per pixel
        dwRBitMask: DWORD;             // mask for red bit
        dwGBitMask: DWORD;             // mask for green bits
        dwBBitMask: DWORD;             // mask for blue bits
        dwRGBAlphaBitMask: DWORD;      // mask for alpha channel
        );
      1: (
        _union1a: DWORD;
        _union1b: DWORD;
        _union1c: DWORD;
        _union1d: DWORD;
        dwRGBZBitMask: DWORD;          // mask for Z channel
        );
      2: (
        dwYUVBitCount: DWORD;          // how many bits per pixel
        dwYBitMask: DWORD;             // mask for Y bits
        dwUBitMask: DWORD;             // mask for U bits
        dwVBitMask: DWORD;             // mask for V bits
        dwYUVAlphaBitMask: DWORD;      // mask for alpha channel
        );
      3: (
        _union3a: DWORD;
        _union3b: DWORD;
        _union3c: DWORD;
        _union3d: DWORD;
        dwYUVZBitMask: DWORD;          // mask for Z channel
        );
      4: (
        dwZBufferBitDepth: DWORD;      // how many bits for z buffers
        dwStencilBitDepth: DWORD;      // how many stencil bits (note: dwZBufferBitDepth-dwStencilBitDepth is total Z-only bits)
        dwZBitMask: DWORD;             // mask for Z bits
        dwStencilBitMask: DWORD;       // mask for stencil bits
        );
      5: (
        dwAlphaBitDepth: DWORD;        // how many bits for alpha channels
        );
      6: (
        dwLuminanceBitCount: DWORD;    // how many bits per pixel
        dwLuminanceBitMask: DWORD;     // mask for luminance bits
        _union6a: DWORD;
        _union6b: DWORD;
        dwLuminanceAlphaBitMask: DWORD;
       );
      7: (
        dwBumpBitCount: DWORD;         // how many bits per "buxel", total
        dwBumpDuBitMask: DWORD;        // mask for bump map U delta bits
        dwBumpDvBitMask: DWORD;        // mask for bump map V delta bits
        dwBumpLuminanceBitMask: DWORD; // mask for luminance in bump map
       );
  end;

  DDPIXELFORMAT = TDDPixelFormat;
  LPDDPIXELFORMAT = PDDPixelFormat;

{ DDOVERLAYFX structure }

  PDDOverlayFx = ^TDDOverlayFx;
  TDDOverlayFx = record
    dwSize: DWORD;                         // size of structure
    dwAlphaEdgeBlendBitDepth: DWORD;       // Bit depth used to specify constant for alpha edge blend
    dwAlphaEdgeBlend: DWORD;               // Constant to use as alpha for edge blend
    dwReserved: DWORD;
    dwAlphaDestConstBitDepth: DWORD;       // Bit depth used to specify alpha constant for destination
    case Integer of
    0: (
      dwAlphaDestConst: DWORD;             // Constant to use as alpha channel for dest
      dwAlphaSrcConstBitDepth: DWORD;      // Bit depth used to specify alpha constant for source
      dwAlphaSrcConst: DWORD;              // Constant to use as alpha channel for src
      dckDestColorkey: TDDColorKey;        // DestColorkey override
      dckSrcColorkey: TDDColorKey;         // DestColorkey override
      dwDDFX: DWORD;                       // Overlay FX
      dwFlags: DWORD;                      // flags
      );
    1: (
      lpDDSAlphaDest: IDirectDrawSurface;  // Surface to use as alpha channel for dest
      _union1b: DWORD;
      lpDDSAlphaSrc: IDirectDrawSurface;   // Surface to use as alpha channel for src
      );
  end;

  DDOVERLAYFX = TDDOverlayFx;
  LPDDOVERLAYFX = PDDOverlayFx;

{ TDDBltBatch structure }

  PDDBltBatch = ^TDDBltBatch;
  TDDBltBatch = record
    lprDest: PRect;
    lpDDSSrc: IDirectDrawSurface;
    lprSrc: PRect;
    dwFlags: DWORD;
    lpDDBltFx: PDDBltFX;
  end;

  DDBLTBATCH = TDDBltBatch;
  LPDDBLTBATCH = PDDBltBatch;

{ TDDSurfaceDesc structure }

  PDDSurfaceDesc = ^TDDSurfaceDesc;
  TDDSurfaceDesc = record
    dwSize: DWORD;                   // size of the TDDSurfaceDesc structure
    dwFlags: DWORD;                  // determines what fields are valid
    dwHeight: DWORD;                 // height of surface to be created
    dwWidth: DWORD;                  // width of input surface
    case Integer of
      0: (
        lPitch: Longint;
        dwBackBufferCount: DWORD;        // number of back buffers requested
        case Integer of
        0: (
          dwMipMapCount: DWORD;          // number of mip-map levels requested
          dwAlphaBitDepth: DWORD;        // depth of alpha buffer requested
          dwReserved: DWORD;             // reserved
          lpSurface: Pointer;            // pointer to the associated surface memory
          ddckCKDestOverlay: TDDColorKey;// color key for destination overlay use
          ddckCKDestBlt: TDDColorKey;    // color key for destination blt use
          ddckCKSrcOverlay: TDDColorKey; // color key for source overlay use
          ddckCKSrcBlt: TDDColorKey;     // color key for source blt use
          ddpfPixelFormat: TDDPixelFormat;// pixel format description of the surface
          ddsCaps: TDDSCaps;             // direct draw surface capabilities
          );
        1: (
          dwZBufferBitDepth: DWORD;      // depth of Z buffer requested
          );
        2: (
          dwRefreshRate: DWORD;          // refresh rate (used when display mode is described)
          );
      );
      1: (
        dwLinearSize: DWORD
      );
  end;

  DDSURFACEDESC = TDDSurfaceDesc;
  LPDDSURFACEDESC = PDDSurfaceDesc;

{ TDDSurfaceDesc2 structure }

  PDDSurfaceDesc2 = ^TDDSurfaceDesc2;
  TDDSurfaceDesc2 = record
    dwSize: DWORD;                   // size of the TDDSurfaceDesc structure
    dwFlags: DWORD;                  // determines what fields are valid
    dwHeight: DWORD;                 // height of surface to be created
    dwWidth: DWORD;                  // width of input surface
    case Integer of
      0: (
        lPitch: Longint;
        dwBackBufferCount: DWORD;        // number of back buffers requested
        case Integer of
        0: (
          dwMipMapCount: DWORD;          // number of mip-map levels requested
          dwAlphaBitDepth: DWORD;        // depth of alpha buffer requested
          dwReserved: DWORD;             // reserved
          lpSurface: Pointer;            // pointer to the associated surface memory
          ddckCKDestOverlay: TDDColorKey;// color key for destination overlay use
          ddckCKDestBlt: TDDColorKey;    // color key for destination blt use
          ddckCKSrcOverlay: TDDColorKey; // color key for source overlay use
          ddckCKSrcBlt: TDDColorKey;     // color key for source blt use
          ddpfPixelFormat: TDDPixelFormat;// pixel format description of the surface
          ddsCaps: TDDSCaps2;            // direct draw surface capabilities
          dwTextureStage: DWORD;         // stage in multitexture cascade
          );
        1: (
          //dwZBufferBitDepth: DWORD;    // dwZBufferBitDepth removed, use ddpfPixelFormat one instead
          );
        2: (
          dwRefreshRate: DWORD;          // refresh rate (used when display mode is described)
          );
      );
      1: (
        dwLinearSize: DWORD
      );
  end;

  DDSURFACEDESC2 = TDDSurfaceDesc2;
  LPDDSURFACEDESC2 = PDDSurfaceDesc2;

{ TDDOptSurfaceDesc structure }

  PDDOptSurfaceDesc = ^TDDOptSurfaceDesc;
  TDDOptSurfaceDesc = record
    dwSize: DWORD;             // size of the DDOPTSURFACEDESC structure
    dwFlags: DWORD;            // determines what fields are valid
    ddSCaps: TDDSCaps2;        // Common caps like: Memory type
    ddOSCaps: TDDOSCaps;       // Common caps like: Memory type
    guid: TGUID;               // Compression technique GUID
    dwCompressionRatio: DWORD; // Compression ratio
  end;

  DDOPTSURFACEDESC = TDDOptSurfaceDesc;
  LPDDOPTSURFACEDESC = PDDOptSurfaceDesc;

{ TDDColorControl structure }

  PDDColorControl = ^TDDColorControl;
  TDDColorControl = record
    dwSize: DWORD;
    dwFlags: DWORD;
    lBrightness: Longint;
    lContrast: Longint;
    lHue: Longint;
    lSaturation: Longint;
    lSharpness: Longint;
    lGamma: Longint;
    lColorEnable: Longint;
    dwReserved1: DWORD;
  end;

  DDCOLORCONTROL = TDDColorControl;
  LPDDCOLORCONTROL = PDDCOLORCONTROL;

{ TDDGammaRamp structure }

  PDDGammaRamp = ^TDDGammaRamp;
  TDDGammaRamp = record
    Red: array[0..255] of Word;
    Green: array[0..255] of Word;
    Blue: array[0..255] of Word;
  end;

  DDGAMMARAMP = TDDGammaRamp;
  LPDDGAMMARAMP = PDDGammaRamp;

{ TDDDeviceIdentifier structure }

  PDDDeviceIdentifier = ^TDDDeviceIdentifier;
  TDDDeviceIdentifier = record
    //
    // These elements are for presentation to the user only. They should not be used to identify particular
    // drivers, since this is unreliable and many different strings may be associated with the same
    // device, and the same driver from different vendors.
    //
    szDriver: array[0..MAX_DDDEVICEID_STRING-1] of Char;
    szDescription: array[0..MAX_DDDEVICEID_STRING-1] of Char;

    //
    // This element is the version of the DirectDraw/3D driver. It is legal to do <, > comparisons
    // on the whole 64 bits. Caution should be exercised if you use this element to identify problematic
    // drivers. It is recommended that guidDeviceIdentifier is used for this purpose.
    //
    // This version has the form:
    //  wProduct = HIWORD(liDriverVersion.HighPart)
    //  wVersion = LOWORD(liDriverVersion.HighPart)
    //  wSubVersion = HIWORD(liDriverVersion.LowPart)
    //  wBuild = LOWORD(liDriverVersion.LowPart)
    //
    liDriverVersion: TLargeInteger;     // Defined for applications and other 32 bit components

    //
    // These elements can be used to identify particular chipsets. Use with extreme caution.
    //   dwVendorId     Identifies the manufacturer. May be zero if unknown.
    //   dwDeviceId     Identifies the type of chipset. May be zero if unknown.
    //   dwSubSysId     Identifies the subsystem, typically this means the particular board. May be zero if unknown.
    //   dwRevision     Identifies the revision level of the chipset. May be zero if unknown.
    //
    dwVendorId: DWORD;
    dwDeviceId: DWORD;
    dwSubSysId: DWORD;
    dwRevision: DWORD;

    //
    // This element can be used to check changes in driver/chipset. This GUID is a unique identifier for the
    // driver/chipset pair. Use this element if you wish to track changes to the driver/chipset in order to
    // reprofile the graphics subsystem.
    // This element can also be used to identify particular problematic drivers.
    //
    guidDeviceIdentifier: TGUID;
  end;

  DDDEVICEIDENTIFIER = TDDDeviceIdentifier;
  LPDDDEVICEIDENTIFIER = PDDDeviceIdentifier;

{ Callbacks }

  TClipperCallback = function(lpDDClipper: IDirectDrawClipper; hWnd: HWND;
      Code: DWORD; lpContext: Pointer): HResult; stdcall;
  LPCLIPPERCALLBACK = TClipperCallback;

  TSurfacesStreamingCallback = function(Arg: DWORD): HResult; stdcall;
  LPSURFACESTREAMINGCALLBACK =TSurfacesStreamingCallback;

  TDDEnumModesCallback = function(const lpDDSurfaceDesc: TDDSurfaceDesc;
      lpContext: Pointer): HResult; stdcall;
  LPDDENUMMODESCALLBACK = TDDEnumModesCallback;

  TDDEnumModesCallback2 = function(const lpDDSurfaceDesc: TDDSurfaceDesc2;
      lpContext: Pointer): HResult; stdcall;
  LPDDENUMMODESCALLBACK2 = TDDEnumModesCallback2;

  TDDEnumSurfacesCallback = function(lpDDSurface: IDirectDrawSurface;
      const lpDDSurfaceDesc: TDDSurfaceDesc; lpContext: Pointer): HResult; stdcall;
  LPDDENUMSURFACESCALLBACK = TDDEnumSurfacesCallback;

  TDDEnumSurfacesCallback2 = function(lpDDSurface: IDirectDrawSurface4;
      const lpDDSurfaceDesc: TDDSurfaceDesc2; lpContext: Pointer): HResult; stdcall;
  LPDDENUMSURFACESCALLBACK2 = TDDEnumSurfacesCallback2;

{ IDirectDraw Interface }

  IDirectDraw = interface(IUnknown)
    ['{6C14DB80-A733-11CE-A521-0020AF0BE560}']
    // IDirectDraw methods
    function Compact: HResult; stdcall;
    function CreateClipper(dwFlags: DWORD; out lplpDDClipper: IDirectDrawClipper;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreatePalette(dwFlags: DWORD; lpColorTable: PPaletteEntry;
        out lplpDDPalette: IDirectDrawPalette; pUnkOuter: IUnknown): HResult; stdcall;
    function CreateSurface(const lpDDSurfaceDesc: TDDSurfaceDesc;
        out lplpDDSurface: IDirectDrawSurface; pUnkOuter: IUnknown): HResult; stdcall;
    function DuplicateSurface(lpDDSurface: IDirectDrawSurface;
        out lplpDupDDSurface: IDirectDrawSurface): HResult; stdcall;
    function EnumDisplayModes(dwFlags: DWORD;
        const lpDDSurfaceDesc: TDDSurfaceDesc; lpContext: Pointer;
        lpEnumModesCallback: TDDEnumModesCallback): HResult; stdcall;
    function EnumSurfaces(dwFlags: DWORD; const lpDDSD: TDDSurfaceDesc;
        lpContext: Pointer; lpEnumCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function FlipToGDISurface: HResult; stdcall;
    function GetCaps(var lpDDDriverCaps: TDDCaps; var lpDDHELCaps: TDDCaps): HResult; stdcall;
    function GetDisplayMode(var lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function GetFourCCCodes(var lpNumCodes, lpCodes: DWORD): HResult; stdcall;
    function GetGDISurface(out lplpGDIDDSSurface: IDirectDrawSurface): HResult; stdcall;
    function GetMonitorFrequency(var lpdwFrequency: DWORD): HResult; stdcall;
    function GetScanLine(var lpdwScanLine: DWORD): HResult; stdcall;
    function GetVerticalBlankStatus(var lpbIsInVB: BOOL): HResult; stdcall;
    function Initialize(lpGUID: PGUID): HResult; stdcall;
    function RestoreDisplayMode: HResult; stdcall;
    function SetCooperativeLevel(hWnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function SetDisplayMode(dwWidth, dwHeight, dwBpp: DWORD): HResult; stdcall;
    function WaitForVerticalBlank(dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
  end;

{ IDirectDraw2 Interface }

  IDirectDraw2 = interface(IUnknown)
    ['{B3A6F3E0-2B43-11CF-A2DE-00AA00B93356}']
    // IDirectDraw methods
    function Compact: HResult; stdcall;
    function CreateClipper(dwFlags: DWORD; out lplpDDClipper: IDirectDrawClipper;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreatePalette(dwFlags: DWORD; lpColorTable: PPaletteEntry;
        out lplpDDPalette: IDirectDrawPalette; pUnkOuter: IUnknown): HResult; stdcall;
    function CreateSurface(const lpDDSurfaceDesc: TDDSurfaceDesc;
        out lplpDDSurface: IDirectDrawSurface; pUnkOuter: IUnknown): HResult; stdcall;
    function DuplicateSurface(lpDDSurface: IDirectDrawSurface;
        out lplpDupDDSurface: IDirectDrawSurface): HResult; stdcall;
    function EnumDisplayModes(dwFlags: DWORD;
        const lpDDSurfaceDesc: TDDSurfaceDesc; lpContext: Pointer;
        lpEnumModesCallback: TDDEnumModesCallback): HResult; stdcall;
    function EnumSurfaces(dwFlags: DWORD; const lpDDSD: TDDSurfaceDesc;
        lpContext: Pointer; lpEnumCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function FlipToGDISurface: HResult; stdcall;
    function GetCaps(var lpDDDriverCaps: TDDCaps; var lpDDHELCaps: TDDCaps): HResult; stdcall;
    function GetDisplayMode(var lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function GetFourCCCodes(var lpNumCodes, lpCodes: DWORD): HResult; stdcall;
    function GetGDISurface(out lplpGDIDDSSurface: IDirectDrawSurface): HResult; stdcall;
    function GetMonitorFrequency(var lpdwFrequency: DWORD): HResult; stdcall;
    function GetScanLine(var lpdwScanLine: DWORD): HResult; stdcall;
    function GetVerticalBlankStatus(var lpbIsInVB: BOOL): HResult; stdcall;
    function Initialize(lpGUID: PGUID): HResult; stdcall;
    function RestoreDisplayMode: HResult; stdcall;
    function SetCooperativeLevel(hWnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function SetDisplayMode(dwWidth, dwHeight, dwBPP, dwRefreshRate: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function WaitForVerticalBlank(dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    // IDirectDraw2 methods
    function GetAvailableVidMem(var lpDDSCaps: TDDSCaps;
        var lpdwTotal, lpdwFree: DWORD): HResult; stdcall;
  end;

{ IDirectDraw4 Interface }

  IDirectDraw4 = interface(IUnknown)
    ['{9C59509A-39BD-11D1-8C4A-00C04FD930C5}']
    // IDirectDraw methods
    function Compact: HResult; stdcall;
    function CreateClipper(dwFlags: DWORD; out lplpDDClipper: IDirectDrawClipper;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreatePalette(dwFlags: DWORD; lpColorTable: PPaletteEntry;
        out lplpDDPalette: IDirectDrawPalette; pUnkOuter: IUnknown): HResult; stdcall;
    function CreateSurface(const lpDDSurfaceDesc: TDDSurfaceDesc2;
        out lplpDDSurface: IDirectDrawSurface4; pUnkOuter: IUnknown): HResult; stdcall;
    function DuplicateSurface(lpDDSurface: IDirectDrawSurface4;
        out lplpDupDDSurface: IDirectDrawSurface4): HResult; stdcall;
    function EnumDisplayModes(dwFlags: DWORD;
        const lpDDSurfaceDesc: TDDSurfaceDesc2; lpContext: Pointer;
        lpEnumModesCallback: TDDEnumModesCallback2): HResult; stdcall;
    function EnumSurfaces(dwFlags: DWORD; const lpDDSD: TDDSurfaceDesc2;
        lpContext: Pointer; lpEnumCallback: TDDEnumSurfacesCallback2): HResult; stdcall;
    function FlipToGDISurface: HResult; stdcall;
    function GetCaps(var lpDDDriverCaps: TDDCaps; var lpDDHELCaps: TDDCaps): HResult; stdcall;
    function GetDisplayMode(var lpDDSurfaceDesc: TDDSurfaceDesc2): HResult; stdcall;
    function GetFourCCCodes(var lpNumCodes, lpCodes: DWORD): HResult; stdcall;
    function GetGDISurface(out lplpGDIDDSSurface: IDirectDrawSurface2): HResult; stdcall;
    function GetMonitorFrequency(var lpdwFrequency: DWORD): HResult; stdcall;
    function GetScanLine(var lpdwScanLine: DWORD): HResult; stdcall;
    function GetVerticalBlankStatus(var lpbIsInVB: BOOL): HResult; stdcall;
    function Initialize(lpGUID: PGUID): HResult; stdcall;
    function RestoreDisplayMode: HResult; stdcall;
    function SetCooperativeLevel(hWnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function SetDisplayMode(dwWidth, dwHeight, dwBPP, dwRefreshRate: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function WaitForVerticalBlank(dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    // IDirectDraw2 methods
    function GetAvailableVidMem(var lpDDSCaps: TDDSCaps;
        var lpdwTotal, lpdwFree: DWORD): HResult; stdcall;
    // IDirectDraw4 methods
    function GetSurfaceFromDC(hdc: HDC; lpDDS: IDirectDrawSurface4): HResult; stdcall;
    function RestoreAllSurfaces: HResult; stdcall;
    function TestCooperativeLevel: HResult; stdcall;
    function GetDeviceIdentifier(var lpdddi: TDDDeviceIdentifier; dwFlags: DWORD): HResult; stdcall;
  end;

{ IDirectDrawPalette Interface }

  IDirectDrawPalette = interface(IUnknown)
    ['{6C14DB84-A733-11CE-A521-0020AF0BE560}']
    // IDirectDrawPalette methods
    function GetCaps(varlpdwCaps: DWORD): HResult; stdcall;
    function GetEntries(dwFlags: DWORD; dwBase: DWORD; dwNumEntries: DWORD;
        lpEntries: PPaletteEntry): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw; dwFlags: DWORD;
        lpDDColorTable: PPaletteEntry): HResult; stdcall;
    function SetEntries(dwFlags: DWORD; dwStartingEntry: DWORD;
        dwCount: DWORD; lpEntries: PPaletteEntry): HResult; stdcall;
  end;

{ IDirectDrawClipper Interface }

  IDirectDrawClipper = interface(IUnknown)
    ['{6C14DB85-A733-11CE-A521-0020AF0BE560}']
    // IDirectDrawClipper methods
    function GetClipList(const lpRect: TRect; lpClipList: PRgnData;
        var lpdwSize: DWORD): HResult; stdcall;
    function GetHWnd(var lphWnd: HWND): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw; dwFlags: DWORD): HResult; stdcall;
    function IsClipListChanged(var lpbChanged: BOOL): HResult; stdcall;
    function SetClipList(lpClipList: PRgnData; dwFlags: DWORD): HResult; stdcall;
    function SetHWnd(dwFlags: DWORD; hWnd: HWND): HResult; stdcall;
  end;

{ IDirectDrawSurface Interface }

  IDirectDrawSurface = interface(IUnknown)
    ['{6C14DB81-A733-11CE-A521-0020AF0BE560}']
    // IDirectDrawSurface methods
    function AddAttachedSurface(lpDDSAttachedSurface: IDirectDrawSurface): HResult; stdcall;
    function AddOverlayDirtyRect(const lpRect: TRect): HResult; stdcall;
    function Blt(const lpDestRect: TRect; lpDDSrcSurface: IDirectDrawSurface;
        const lpSrcRect: TRect; dwFlags: DWORD; const lpDDBltFx: TDDBltFX): HResult; stdcall;
    function BltBatch(const lpDDBltBatch: TDDBltBatch; dwCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function BltFast(dwX, dwY: DWORD; lpDDSrcSurface: IDirectDrawSurface;
        const lpSrcRect: TRect; dwTrans: DWORD): HResult; stdcall;
    function DeleteAttachedSurface(dwFlags: DWORD;
        lpDDSAttachedSurface: IDirectDrawSurface): HResult; stdcall;
    function EnumAttachedSurfaces(lpContext: Pointer;
        lpEnumSurfacesCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function EnumOverlayZOrders(dwFlags: DWORD; lpContext: Pointer;
        lpfnCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function Flip(lpDDSurfaceTargetOverride: IDirectDrawSurface;
        dwFlags: DWORD): HResult; stdcall;
    function GetAttachedSurface(var lpDDSCaps: TDDSCaps;
        out lplpDDAttachedSurface: IDirectDrawSurface): HResult; stdcall;
    function GetBltStatus(dwFlags: DWORD): HResult; stdcall;
    function GetCaps(var lpDDSCaps: TDDSCaps): HResult; stdcall;
    function GetClipper(out lplpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function GetColorKey(dwFlags: DWORD; var lpDDColorKey: TDDColorKey): HResult; stdcall;
    function GetDC(var lphDC: HDC): HResult; stdcall;
    function GetFlipStatus(dwFlags: DWORD): HResult; stdcall;
    function GetOverlayPosition(var lplX, lplY: Longint): HResult; stdcall;
    function GetPalette(out lplpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function GetPixelFormat(var lpDDPixelFormat: TDDPixelFormat): HResult; stdcall;
    function GetSurfaceDesc(var lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw;
        const lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function IsLost: HResult; stdcall;
    function Lock(lpDestRect: PRect; var lpDDSurfaceDesc: TDDSurfaceDesc;
        dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    function ReleaseDC(hDC: HDC): HResult; stdcall;
    function Restore: HResult; stdcall;
    function SetClipper(lpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function SetColorKey(dwFlags: DWORD; const lpDDColorKey: TDDColorKey): HResult; stdcall;
    function SetOverlayPosition(lX, lY: Longint): HResult; stdcall;
    function SetPalette(lpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function Unlock(lpSurfaceData: Pointer): HResult; stdcall;
    function UpdateOverlay(const lpSrcRect: TRect;
        lpDDDestSurface: IDirectDrawSurface; const lpDestRect: TRect;
        dwFlags: DWORD; const lpDDOverlayFx: DDOVERLAYFX ): HResult; stdcall;
    function UpdateOverlayDisplay(dwFlags: DWORD): HResult; stdcall;
    function UpdateOverlayZOrder(dwFlags: DWORD;
        lpDDSReference: IDirectDrawSurface): HResult; stdcall;
  end;

{ IDirectDrawSurface2 Interface }

  IDirectDrawSurface2 = interface(IUnknown)
    ['{57805885-6EEC-11CF-9441-A82303C10E27}']
    // IDirectDrawSurface methods
    function AddAttachedSurface(lpDDSAttachedSurface: IDirectDrawSurface2): HResult; stdcall;
    function AddOverlayDirtyRect(const lpRect: TRect): HResult; stdcall;
    function Blt(const lpDestRect: TRect; lpDDSrcSurface: IDirectDrawSurface2;
        const lpSrcRect: TRect; dwFlags: DWORD; const lpDDBltFx: TDDBltFX): HResult; stdcall;
    function BltBatch(const lpDDBltBatch: TDDBltBatch; dwCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function BltFast(dwX, dwY: DWORD; lpDDSrcSurface: IDirectDrawSurface2;
        const lpSrcRect: TRect; dwTrans: DWORD): HResult; stdcall;
    function DeleteAttachedSurface(dwFlags: DWORD;
        lpDDSAttachedSurface: IDirectDrawSurface2): HResult; stdcall;
    function EnumAttachedSurfaces(lpContext: Pointer;
        lpEnumSurfacesCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function EnumOverlayZOrders(dwFlags: DWORD; lpContext: Pointer;
        lpfnCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function Flip(lpDDSurfaceTargetOverride: IDirectDrawSurface2;
        dwFlags: DWORD): HResult; stdcall;
    function GetAttachedSurface(var lpDDSCaps: TDDSCaps;
        out lplpDDAttachedSurface: IDirectDrawSurface2): HResult; stdcall;
    function GetBltStatus(dwFlags: DWORD): HResult; stdcall;
    function GetCaps(var lpDDSCaps: TDDSCaps): HResult; stdcall;
    function GetClipper(out lplpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function GetColorKey(dwFlags: DWORD; var lpDDColorKey: TDDColorKey): HResult; stdcall;
    function GetDC(var lphDC: HDC): HResult; stdcall;
    function GetFlipStatus(dwFlags: DWORD): HResult; stdcall;
    function GetOverlayPosition(var lplX, lplY: Longint): HResult; stdcall;
    function GetPalette(out lplpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function GetPixelFormat(var lpDDPixelFormat: TDDPixelFormat): HResult; stdcall;
    function GetSurfaceDesc(var lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw; const lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function IsLost: HResult; stdcall;
    function Lock(lpDestRect: PRect; const lpDDSurfaceDesc: TDDSurfaceDesc;
        dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    function ReleaseDC(hDC: HDC): HResult; stdcall;
    function Restore: HResult; stdcall;
    function SetClipper(lpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function SetColorKey(dwFlags: DWORD; const lpDDColorKey: TDDColorKey): HResult; stdcall;
    function SetOverlayPosition(lX, lY: Longint): HResult; stdcall;
    function SetPalette(lpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function Unlock(lpSurfaceData: Pointer): HResult; stdcall;
    function UpdateOverlay(const lpSrcRect: TRect;
        lpDDDestSurface: IDirectDrawSurface2; const lpDestRect: TRect;
        dwFlags: DWORD; const lpDDOverlayFx: DDOVERLAYFX): HResult; stdcall;
    function UpdateOverlayDisplay(dwFlags: DWORD): HResult; stdcall;
    function UpdateOverlayZOrder(dwFlags: DWORD;
        lpDDSReference: IDirectDrawSurface2): HResult; stdcall;
    // IDirectDrawSurface2 methods
    function GetDDInterface(out lplpDD: IUnknown): HResult; stdcall;
    function PageLock(dwFlags: DWORD): HResult; stdcall;
    function PageUnlock(dwFlags: DWORD): HResult; stdcall;
  end;

{ IDirectDrawSurface3 Interface }

  IDirectDrawSurface3 = interface(IUnknown)
    ['{DA044E00-69B2-11D0-A1D5-00AA00B8DFBB}']
    // IDirectDrawSurface methods
    function AddAttachedSurface(lpDDSAttachedSurface: IDirectDrawSurface3): HResult; stdcall;
    function AddOverlayDirtyRect(const lpRect: TRect): HResult; stdcall;
    function Blt(const lpDestRect: TRect; lpDDSrcSurface: IDirectDrawSurface3;
        const lpSrcRect: TRect; dwFlags: DWORD; const lpDDBltFx: TDDBltFX): HResult; stdcall;
    function BltBatch(const lpDDBltBatch: TDDBltBatch; dwCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function BltFast(dwX, dwY: DWORD; lpDDSrcSurface: IDirectDrawSurface3;
        const lpSrcRect: TRect; dwTrans: DWORD): HResult; stdcall;
    function DeleteAttachedSurface(dwFlags: DWORD;
        lpDDSAttachedSurface: IDirectDrawSurface3): HResult; stdcall;
    function EnumAttachedSurfaces(lpContext: Pointer;
        lpEnumSurfacesCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function EnumOverlayZOrders(dwFlags: DWORD; lpContext: Pointer;
        lpfnCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function Flip(lpDDSurfaceTargetOverride: IDirectDrawSurface3;
        dwFlags: DWORD): HResult; stdcall;
    function GetAttachedSurface(var lpDDSCaps: TDDSCaps;
        out lplpDDAttachedSurface: IDirectDrawSurface3): HResult; stdcall;
    function GetBltStatus(dwFlags: DWORD): HResult; stdcall;
    function GetCaps(var lpDDSCaps: TDDSCaps): HResult; stdcall;
    function GetClipper(out lplpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function GetColorKey(dwFlags: DWORD; var lpDDColorKey: TDDColorKey): HResult; stdcall;
    function GetDC(var lphDC: HDC): HResult; stdcall;
    function GetFlipStatus(dwFlags: DWORD): HResult; stdcall;
    function GetOverlayPosition(var lplX, lplY: Longint): HResult; stdcall;
    function GetPalette(out lplpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function GetPixelFormat(var lpDDPixelFormat: TDDPixelFormat): HResult; stdcall;
    function GetSurfaceDesc(var lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw; const lpDDSurfaceDesc: TDDSurfaceDesc): HResult; stdcall;
    function IsLost: HResult; stdcall;
    function Lock(lpDestRect: PRect; const lpDDSurfaceDesc: TDDSurfaceDesc;
        dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    function ReleaseDC(hDC: HDC): HResult; stdcall;
    function Restore: HResult; stdcall;
    function SetClipper(lpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function SetColorKey(dwFlags: DWORD; const lpDDColorKey: TDDColorKey): HResult; stdcall;
    function SetOverlayPosition(lX, lY: Longint): HResult; stdcall;
    function SetPalette(lpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function Unlock(lpSurfaceData: Pointer): HResult; stdcall;
    function UpdateOverlay(const lpSrcRect: TRect;
        lpDDDestSurface: IDirectDrawSurface3; const lpDestRect: TRect;
        dwFlags: DWORD; const lpDDOverlayFx: DDOVERLAYFX): HResult; stdcall;
    function UpdateOverlayDisplay(dwFlags: DWORD): HResult; stdcall;
    function UpdateOverlayZOrder(dwFlags: DWORD;
        lpDDSReference: IDirectDrawSurface3): HResult; stdcall;
    // IDirectDrawSurface2 methods
    function GetDDInterface(out lplpDD: IUnknown): HResult; stdcall;
    function PageLock(dwFlags: DWORD): HResult; stdcall;
    function PageUnlock(dwFlags: DWORD): HResult; stdcall;
    // IDirectDrawSurface3 methods
    function SetSurfaceDesc(const lpddsd: TDDSurfaceDesc; dwFlags: DWORD): HResult; stdcall;
  end;

{ IDirectDrawSurface4 Interface }

  IDirectDrawSurface4 = interface(IUnknown)
    ['{0B2B8630-AD35-11D0-8EA6-00609797EA5B}']
    // IDirectDrawSurface methods
    function AddAttachedSurface(lpDDSAttachedSurface: IDirectDrawSurface4): HResult; stdcall;
    function AddOverlayDirtyRect(const lpRect: TRect): HResult; stdcall;
    function Blt(const lpDestRect: TRect; lpDDSrcSurface: IDirectDrawSurface4;
        const lpSrcRect: TRect; dwFlags: DWORD; const lpDDBltFx: TDDBltFX): HResult; stdcall;
    function BltBatch(const lpDDBltBatch: TDDBltBatch; dwCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function BltFast(dwX, dwY: DWORD; lpDDSrcSurface: IDirectDrawSurface4;
        const lpSrcRect: TRect; dwTrans: DWORD): HResult; stdcall;
    function DeleteAttachedSurface(dwFlags: DWORD;
        lpDDSAttachedSurface: IDirectDrawSurface4): HResult; stdcall;
    function EnumAttachedSurfaces(lpContext: Pointer;
        lpEnumSurfacesCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function EnumOverlayZOrders(dwFlags: DWORD; lpContext: Pointer;
        lpfnCallback: TDDEnumSurfacesCallback): HResult; stdcall;
    function Flip(lpDDSurfaceTargetOverride: IDirectDrawSurface4;
        dwFlags: DWORD): HResult; stdcall;
    function GetAttachedSurface(var lpDDSCaps: TDDSCaps2;
        out lplpDDAttachedSurface: IDirectDrawSurface4): HResult; stdcall;
    function GetBltStatus(dwFlags: DWORD): HResult; stdcall;
    function GetCaps(var lpDDSCaps: TDDSCaps2): HResult; stdcall;
    function GetClipper(out lplpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function GetColorKey(dwFlags: DWORD; var lpDDColorKey: TDDColorKey): HResult; stdcall;
    function GetDC(var lphDC: HDC): HResult; stdcall;
    function GetFlipStatus(dwFlags: DWORD): HResult; stdcall;
    function GetOverlayPosition(var lplX, lplY: Longint): HResult; stdcall;
    function GetPalette(out lplpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function GetPixelFormat(var lpDDPixelFormat: TDDPixelFormat): HResult; stdcall;
    function GetSurfaceDesc(var lpDDSurfaceDesc: TDDSurfaceDesc2): HResult; stdcall;
    function Initialize(lpDD: IDirectDraw; const lpDDSurfaceDesc: TDDSurfaceDesc2): HResult; stdcall;
    function IsLost: HResult; stdcall;
    function Lock(lpDestRect: PRect; const lpDDSurfaceDesc: TDDSurfaceDesc;
        dwFlags: DWORD; hEvent: THandle): HResult; stdcall;
    function ReleaseDC(hDC: HDC): HResult; stdcall;
    function Restore: HResult; stdcall;
    function SetClipper(lpDDClipper: IDirectDrawClipper): HResult; stdcall;
    function SetColorKey(dwFlags: DWORD; const lpDDColorKey: TDDColorKey): HResult; stdcall;
    function SetOverlayPosition(lX, lY: Longint): HResult; stdcall;
    function SetPalette(lpDDPalette: IDirectDrawPalette): HResult; stdcall;
    function Unlock(lpSurfaceData: Pointer): HResult; stdcall;
    function UpdateOverlay(const lpSrcRect: TRect; lpDDDestSurface: IDirectDrawSurface4;
        const lpDestRect: TRect; dwFlags: DWORD; const lpDDOverlayFx: DDOVERLAYFX): HResult; stdcall;
    function UpdateOverlayDisplay(dwFlags: DWORD): HResult; stdcall;
    function UpdateOverlayZOrder(dwFlags: DWORD; lpDDSReference: IDirectDrawSurface4): HResult; stdcall;
    // IDirectDrawSurface2 methods
    function GetDDInterface(out lplpDD: IUnknown): HResult; stdcall;
    function PageLock(dwFlags: DWORD): HResult; stdcall;
    function PageUnlock(dwFlags: DWORD): HResult; stdcall;
    // IDirectDrawSurface3 methods
    function SetSurfaceDesc(const lpddsd: TDDSurfaceDesc2; dwFlags: DWORD): HResult; stdcall;
    // IDirectDrawSurface4 methods
    function SetPrivateData(const guidTag: TGUID; lpData: Pointer;
      cbSize: DWORD; dwFlags: DWORD): HResult; stdcall;
    function GetPrivateData(const guidTag: TGUID; lpData: Pointer;
      var cbSize: DWORD): HResult; stdcall;
    function FreePrivateData(const guidTag: TGUID): HResult; stdcall;
    function GetUniquenessValue(var lpValue: DWORD): HResult; stdcall;
    function ChangeUniquenessValue: HResult; stdcall;
  end;

{ IDirectDrawColorControl Interface }

  IDirectDrawColorControl = interface(IUnknown)
    ['{4B9F0EE0-0D7E-11D0-9B06-00A0C903A3B8}']
    // IDirectDrawColorControl methods
    function GetColorControls(var lpColorControl: TDDColorControl): HResult; stdcall;
    function SetColorControls(const lpColorControl: TDDColorControl): HResult; stdcall;
  end;

{ IDirectDrawGammaControl Interface }

  IDirectDrawGammaControl = interface(IUnknown)
    ['{69C11C3E-B46B-11D1-AD7A-00C04FC29B4E}']
    // IDirectDrawGammaControl methods
    function GetGammaRamp(dwFlags: DWORD; var lpRampData: TDDGammaRamp): HResult; stdcall;
    function SetGammaRamp(dwFlags: DWORD; const lpRampData: TDDGammaRamp): HResult; stdcall;
  end;

const
{ Flags for DirectDrawEnumerateEx }
  DDENUM_ATTACHEDSECONDARYDEVICES = $00000001;
  DDENUM_DETACHEDSECONDARYDEVICES = $00000002;
  DDENUM_NONDISPLAYDEVICES        = $00000004;

{ Flags for the IDirectDraw4.GetDeviceIdentifier method }
  DDGDI_GETHOSTIDENTIFIER = $00000001;

{ ddsCaps field is valid. }
  DDSD_CAPS               = $00000001;     // default
  DDSD_HEIGHT             = $00000002;
  DDSD_WIDTH              = $00000004;
  DDSD_PITCH              = $00000008;
  DDSD_BACKBUFFERCOUNT    = $00000020;
  DDSD_ZBUFFERBITDEPTH    = $00000040;
  DDSD_ALPHABITDEPTH      = $00000080;
  DDSD_LPSURFACE          = $00000800;
  DDSD_PIXELFORMAT        = $00001000;
  DDSD_CKDESTOVERLAY      = $00002000;
  DDSD_CKDESTBLT          = $00004000;
  DDSD_CKSRCOVERLAY       = $00008000;
  DDSD_CKSRCBLT           = $00010000;
  DDSD_MIPMAPCOUNT        = $00020000;
  DDSD_REFRESHRATE        = $00040000;
  DDSD_LINEARSIZE         = $00080000;
  DDSD_TEXTURESTAGE       = $00100000;
  DDSD_ALL                = $0007f9ee;

{ DirectDraw Driver Capability Flags }

  DDCAPS_3D                   = $00000001;
  DDCAPS_ALIGNBOUNDARYDEST    = $00000002;
  DDCAPS_ALIGNSIZEDEST        = $00000004;
  DDCAPS_ALIGNBOUNDARYSRC     = $00000008;
  DDCAPS_ALIGNSIZESRC         = $00000010;
  DDCAPS_ALIGNSTRIDE          = $00000020;
  DDCAPS_BLT                  = $00000040;
  DDCAPS_BLTQUEUE             = $00000080;
  DDCAPS_BLTFOURCC            = $00000100;
  DDCAPS_BLTSTRETCH           = $00000200;
  DDCAPS_GDI                  = $00000400;
  DDCAPS_OVERLAY              = $00000800;
  DDCAPS_OVERLAYCANTCLIP      = $00001000;
  DDCAPS_OVERLAYFOURCC        = $00002000;
  DDCAPS_OVERLAYSTRETCH       = $00004000;
  DDCAPS_PALETTE              = $00008000;
  DDCAPS_PALETTEVSYNC         = $00010000;
  DDCAPS_READSCANLINE         = $00020000;
  DDCAPS_STEREOVIEW           = $00040000;
  DDCAPS_VBI                  = $00080000;
  DDCAPS_ZBLTS                = $00100000;
  DDCAPS_ZOVERLAYS            = $00200000;
  DDCAPS_COLORKEY             = $00400000;
  DDCAPS_ALPHA                = $00800000;
  DDCAPS_COLORKEYHWASSIST     = $01000000;
  DDCAPS_NOHARDWARE           = $02000000;
  DDCAPS_BLTCOLORFILL         = $04000000;
  DDCAPS_BANKSWITCHED         = $08000000;
  DDCAPS_BLTDEPTHFILL         = $10000000;
  DDCAPS_CANCLIP              = $20000000;
  DDCAPS_CANCLIPSTRETCHED     = $40000000;
  DDCAPS_CANBLTSYSMEM         = $80000000;

{ More DirectDraw Driver Capability Flags (dwCaps2) }

  DDCAPS2_CERTIFIED            = $00000001;
  DDCAPS2_NO2DDURING3DSCENE    = $00000002;
  DDCAPS2_VIDEOPORT            = $00000004;
  DDCAPS2_AUTOFLIPOVERLAY      = $00000008;
  DDCAPS2_CANBOBINTERLEAVED    = $00000010;
  DDCAPS2_CANBOBNONINTERLEAVED = $00000020;
  DDCAPS2_COLORCONTROLOVERLAY  = $00000040;
  DDCAPS2_COLORCONTROLPRIMARY  = $00000080;
  DDCAPS2_CANDROPZ16BIT        = $00000100;
  DDCAPS2_NONLOCALVIDMEM       = $00000200;
  DDCAPS2_NONLOCALVIDMEMCAPS   = $00000400;
  DDCAPS2_NOPAGELOCKREQUIRED   = $00000800;
  DDCAPS2_WIDESURFACES         = $00001000;
  DDCAPS2_CANFLIPODDEVEN       = $00002000;
  DDCAPS2_CANBOBHARDWARE       = $00004000;
  DDCAPS2_COPYFOURCC           = $00008000;
  DDCAPS2_PRIMARYGAMMA         = $00020000;
  DDCAPS2_CANRENDERWINDOWED    = $00080000;
  DDCAPS2_CANCALIBRATEGAMMA    = $00100000;
  DDCAPS2_FLIPINTERVAL         = $00200000;
  DDCAPS2_FLIPNOVSYNC          = $00400000;

{ DirectDrawSurface Capability Flags }

  DDSCAPS_RESERVED1           = $00000001; { DDSCAPS_3D }
  DDSCAPS_ALPHA               = $00000002;
  DDSCAPS_BACKBUFFER          = $00000004;
  DDSCAPS_COMPLEX             = $00000008;
  DDSCAPS_FLIP                = $00000010;
  DDSCAPS_FRONTBUFFER         = $00000020;
  DDSCAPS_OFFSCREENPLAIN      = $00000040;
  DDSCAPS_OVERLAY             = $00000080;
  DDSCAPS_PALETTE             = $00000100;
  DDSCAPS_PRIMARYSURFACE      = $00000200;
  DDSCAPS_PRIMARYSURFACELEFT  = $00000400;
  DDSCAPS_SYSTEMMEMORY        = $00000800;
  DDSCAPS_TEXTURE             = $00001000;
  DDSCAPS_3DDEVICE            = $00002000;
  DDSCAPS_VIDEOMEMORY         = $00004000;
  DDSCAPS_VISIBLE             = $00008000;
  DDSCAPS_WRITEONLY           = $00010000;
  DDSCAPS_ZBUFFER             = $00020000;
  DDSCAPS_OWNDC               = $00040000;
  DDSCAPS_LIVEVIDEO           = $00080000;
  DDSCAPS_HWCODEC             = $00100000;
  DDSCAPS_MODEX               = $00200000;
  DDSCAPS_MIPMAP              = $00400000;
  DDSCAPS_RESERVED2           = $00800000;
  DDSCAPS_ALLOCONLOAD         = $04000000;
  DDSCAPS_VIDEOPORT           = $08000000;
  DDSCAPS_LOCALVIDMEM         = $10000000;
  DDSCAPS_NONLOCALVIDMEM      = $20000000;
  DDSCAPS_STANDARDVGAMODE     = $40000000;
  DDSCAPS_OPTIMIZED           = $80000000;

{ DirectDrawSurface Capability Flags 2 }

  DDSCAPS2_HARDWAREDEINTERLACE = $00000002;
  DDSCAPS2_HINTDYNAMIC         = $00000004;
  DDSCAPS2_HINTSTATIC          = $00000008;
  DDSCAPS2_TEXTUREMANAGE       = $00000010;
  DDSCAPS2_RESERVED1           = $00000020;
  DDSCAPS2_RESERVED2           = $00000040;
  DDSCAPS2_OPAQUE              = $00000080;
  DDSCAPS2_HINTANTIALIASING    = $00000100;

{ TDDOptSurfaceDesc flags }

  DDOSD_GUID              = $00000001;
  DDOSD_COMPRESSION_RATIO = $00000002;
  DDOSD_SCAPS             = $00000004;
  DDOSD_OSCAPS            = $00000008;
  DDOSD_ALL               = $0000000F;

{ ddOSCaps field is valid. }

  DDOSDCAPS_OPTCOMPRESSED    = $00000001;
  DDOSDCAPS_OPTREORDERED     = $00000002;
  DDOSDCAPS_MONOLITHICMIPMAP = $00000004;
  DDOSDCAPS_VALIDSCAPS       = DDSCAPS_SYSTEMMEMORY or DDSCAPS_VIDEOMEMORY or
                               DDSCAPS_LOCALVIDMEM or DDSCAPS_NONLOCALVIDMEM;
  DDOSDCAPS_VALIDOSCAPS      = $00000007;

{ DirectDraw FX Alpha Capability Flags }

  DDFXALPHACAPS_BLTALPHAEDGEBLEND         = $00000001;
  DDFXALPHACAPS_BLTALPHAPIXELS            = $00000002;
  DDFXALPHACAPS_BLTALPHAPIXELSNEG         = $00000004;
  DDFXALPHACAPS_BLTALPHASURFACES          = $00000008;
  DDFXALPHACAPS_BLTALPHASURFACESNEG       = $00000010;
  DDFXALPHACAPS_OVERLAYALPHAEDGEBLEND     = $00000020;
  DDFXALPHACAPS_OVERLAYALPHAPIXELS        = $00000040;
  DDFXALPHACAPS_OVERLAYALPHAPIXELSNEG     = $00000080;
  DDFXALPHACAPS_OVERLAYALPHASURFACES      = $00000100;
  DDFXALPHACAPS_OVERLAYALPHASURFACESNEG   = $00000200;

{ DirectDraw FX Capability Flags }

  DDFXCAPS_BLTARITHSTRETCHY       = $00000020;
  DDFXCAPS_BLTARITHSTRETCHYN      = $00000010;
  DDFXCAPS_BLTMIRRORLEFTRIGHT     = $00000040;
  DDFXCAPS_BLTMIRRORUPDOWN        = $00000080;
  DDFXCAPS_BLTROTATION            = $00000100;
  DDFXCAPS_BLTROTATION90          = $00000200;
  DDFXCAPS_BLTSHRINKX             = $00000400;
  DDFXCAPS_BLTSHRINKXN            = $00000800;
  DDFXCAPS_BLTSHRINKY             = $00001000;
  DDFXCAPS_BLTSHRINKYN            = $00002000;
  DDFXCAPS_BLTSTRETCHX            = $00004000;
  DDFXCAPS_BLTSTRETCHXN           = $00008000;
  DDFXCAPS_BLTSTRETCHY            = $00010000;
  DDFXCAPS_BLTSTRETCHYN           = $00020000;
  DDFXCAPS_OVERLAYARITHSTRETCHY   = $00040000;
  DDFXCAPS_OVERLAYARITHSTRETCHYN  = $00000008;
  DDFXCAPS_OVERLAYSHRINKX         = $00080000;
  DDFXCAPS_OVERLAYSHRINKXN        = $00100000;
  DDFXCAPS_OVERLAYSHRINKY         = $00200000;
  DDFXCAPS_OVERLAYSHRINKYN        = $00400000;
  DDFXCAPS_OVERLAYSTRETCHX        = $00800000;
  DDFXCAPS_OVERLAYSTRETCHXN       = $01000000;
  DDFXCAPS_OVERLAYSTRETCHY        = $02000000;
  DDFXCAPS_OVERLAYSTRETCHYN       = $04000000;
  DDFXCAPS_OVERLAYMIRRORLEFTRIGHT = $08000000;
  DDFXCAPS_OVERLAYMIRRORUPDOWN    = $10000000;
  DDFXCAPS_BLTALPHA               = $00000001;
  DDFXCAPS_BLTTRANSFORM           = $00000002;
  DDFXCAPS_BLTFILTER              = DDFXCAPS_BLTARITHSTRETCHY;
  DDFXCAPS_OVERLAYALPHA           = $00000004;
  DDFXCAPS_OVERLAYTRANSFORM       = $20000000;
  DDFXCAPS_OVERLAYFILTER          = DDFXCAPS_OVERLAYARITHSTRETCHY;

{ DirectDraw Stereo View Capabilities }

  DDSVCAPS_ENIGMA  = $00000001;
  DDSVCAPS_FLICKER = $00000002;
  DDSVCAPS_REDBLUE = $00000004;
  DDSVCAPS_SPLIT   = $00000008;

{ DirectDrawPalette Capabilities }

  DDPCAPS_4BIT               = $00000001;
  DDPCAPS_8BITENTRIES        = $00000002;
  DDPCAPS_8BIT               = $00000004;
  DDPCAPS_INITIALIZE         = $00000008;
  DDPCAPS_PRIMARYSURFACE     = $00000010;
  DDPCAPS_PRIMARYSURFACELEFT = $00000020;
  DDPCAPS_ALLOW256           = $00000040;
  DDPCAPS_VSYNC              = $00000080;
  DDPCAPS_1BIT               = $00000100;
  DDPCAPS_2BIT               = $00000200;
  DDPCAPS_ALPHA              = $00000400;

{ DirectDraw BitDepth Constants }

  DDBD_1  = $00004000;
  DDBD_2  = $00002000;
  DDBD_4  = $00001000;
  DDBD_8  = $00000800;
  DDBD_16 = $00000400;
  DDBD_24 = $00000200;
  DDBD_32 = $00000100;

{ DirectDraw Set/Get Color Key Flags }

  DDCKEY_COLORSPACE  = $00000001;
  DDCKEY_DESTBLT     = $00000002;
  DDCKEY_DESTOVERLAY = $00000004;
  DDCKEY_SRCBLT      = $00000008;
  DDCKEY_SRCOVERLAY  = $00000010;

{ DirectDraw Color Key Capability Flags }

  DDCKEYCAPS_DESTBLT                = $00000001;
  DDCKEYCAPS_DESTBLTCLRSPACE        = $00000002;
  DDCKEYCAPS_DESTBLTCLRSPACEYUV     = $00000004;
  DDCKEYCAPS_DESTBLTYUV             = $00000008;
  DDCKEYCAPS_DESTOVERLAY            = $00000010;
  DDCKEYCAPS_DESTOVERLAYCLRSPACE    = $00000020;
  DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV = $00000040;
  DDCKEYCAPS_DESTOVERLAYONEACTIVE   = $00000080;
  DDCKEYCAPS_DESTOVERLAYYUV         = $00000100;
  DDCKEYCAPS_SRCBLT                 = $00000200;
  DDCKEYCAPS_SRCBLTCLRSPACE         = $00000400;
  DDCKEYCAPS_SRCBLTCLRSPACEYUV      = $00000800;
  DDCKEYCAPS_SRCBLTYUV              = $00001000;
  DDCKEYCAPS_SRCOVERLAY             = $00002000;
  DDCKEYCAPS_SRCOVERLAYCLRSPACE     = $00004000;
  DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV  = $00008000;
  DDCKEYCAPS_SRCOVERLAYONEACTIVE    = $00010000;
  DDCKEYCAPS_SRCOVERLAYYUV          = $00020000;
  DDCKEYCAPS_NOCOSTOVERLAY          = $00040000;

{ DirectDraw PixelFormat Flags }

  DDPF_ALPHAPIXELS       = $00000001;
  DDPF_ALPHA             = $00000002;
  DDPF_FOURCC            = $00000004;
  DDPF_PALETTEINDEXED4   = $00000008;
  DDPF_PALETTEINDEXEDTO8 = $00000010;
  DDPF_PALETTEINDEXED8   = $00000020;
  DDPF_RGB               = $00000040;
  DDPF_COMPRESSED        = $00000080;
  DDPF_RGBTOYUV          = $00000100;
  DDPF_YUV               = $00000200;
  DDPF_ZBUFFER           = $00000400;
  DDPF_PALETTEINDEXED1   = $00000800;
  DDPF_PALETTEINDEXED2   = $00001000;
  DDPF_ZPIXELS           = $00002000;
  DDPF_STENCILBUFFER     = $00004000;
  DDPF_ALPHAPREMULT      = $00008000;
  DDPF_LUMINANCE         = $00020000;
  DDPF_BUMPLUMINANCE     = $00040000;
  DDPF_BUMPDUDV          = $00080000;

{ DirectDraw SetDisplayMode Flags }

  DDSDM_STANDARDVGAMODE  = $00000001;

{ DirectDraw EnumDisplayModes Flags }

  DDEDM_REFRESHRATES     = $00000001;
  DDEDM_STANDARDVGAMODES = $00000002;

{ DirectDraw EnumSurfaces Flags }

  DDENUMSURFACES_ALL           = $00000001;
  DDENUMSURFACES_MATCH         = $00000002;
  DDENUMSURFACES_NOMATCH       = $00000004;
  DDENUMSURFACES_CANBECREATED  = $00000008;
  DDENUMSURFACES_DOESEXIST     = $00000010;

{ DirectDraw SetCooperativeLevel Flags }

  DDSCL_FULLSCREEN          = $00000001;
  DDSCL_ALLOWREBOOT         = $00000002;
  DDSCL_NOWINDOWCHANGES     = $00000004;
  DDSCL_NORMAL              = $00000008;
  DDSCL_EXCLUSIVE           = $00000010;
  DDSCL_ALLOWMODEX          = $00000040;
  DDSCL_SETFOCUSWINDOW      = $00000080;
  DDSCL_SETDEVICEWINDOW     = $00000100;
  DDSCL_CREATEDEVICEWINDOW  = $00000200;
  DDSCL_MULTITHREADED       = $00000400;
  DDSCL_FPUSETUP            = $00000800;

{ DirectDraw Blt Flags }

  DDBLT_ALPHADEST                = $00000001;
  DDBLT_ALPHADESTCONSTOVERRIDE   = $00000002;
  DDBLT_ALPHADESTNEG             = $00000004;
  DDBLT_ALPHADESTSURFACEOVERRIDE = $00000008;
  DDBLT_ALPHAEDGEBLEND           = $00000010;
  DDBLT_ALPHASRC                 = $00000020;
  DDBLT_ALPHASRCCONSTOVERRIDE    = $00000040;
  DDBLT_ALPHASRCNEG              = $00000080;
  DDBLT_ALPHASRCSURFACEOVERRIDE  = $00000100;
  DDBLT_ASYNC                    = $00000200;
  DDBLT_COLORFILL                = $00000400;
  DDBLT_DDFX                     = $00000800;
  DDBLT_DDROPS                   = $00001000;
  DDBLT_KEYDEST                  = $00002000;
  DDBLT_KEYDESTOVERRIDE          = $00004000;
  DDBLT_KEYSRC                   = $00008000;
  DDBLT_KEYSRCOVERRIDE           = $00010000;
  DDBLT_ROP                      = $00020000;
  DDBLT_ROTATIONANGLE            = $00040000;
  DDBLT_ZBUFFER                  = $00080000;
  DDBLT_ZBUFFERDESTCONSTOVERRIDE = $00100000;
  DDBLT_ZBUFFERDESTOVERRIDE      = $00200000;
  DDBLT_ZBUFFERSRCCONSTOVERRIDE  = $00400000;
  DDBLT_ZBUFFERSRCOVERRIDE       = $00800000;
  DDBLT_WAIT                     = $01000000;
  DDBLT_DEPTHFILL                = $02000000;

{ BltFast Flags }

  DDBLTFAST_NOCOLORKEY   = $00000000;
  DDBLTFAST_SRCCOLORKEY  = $00000001;
  DDBLTFAST_DESTCOLORKEY = $00000002;
  DDBLTFAST_WAIT         = $00000010;

{ Flip Flags }

  DDFLIP_WAIT      = $00000001;
  DDFLIP_EVEN      = $00000002;
  DDFLIP_ODD       = $00000004;
  DDFLIP_NOVSYNC   = $00000008;
  DDFLIP_INTERVAL2 = $02000000;
  DDFLIP_INTERVAL3 = $03000000;
  DDFLIP_INTERVAL4 = $04000000;

{ DirectDraw Surface Overlay Flags }

  DDOVER_ALPHADEST                = $00000001;
  DDOVER_ALPHADESTCONSTOVERRIDE   = $00000002;
  DDOVER_ALPHADESTNEG             = $00000004;
  DDOVER_ALPHADESTSURFACEOVERRIDE = $00000008;
  DDOVER_ALPHAEDGEBLEND           = $00000010;
  DDOVER_ALPHASRC                 = $00000020;
  DDOVER_ALPHASRCCONSTOVERRIDE    = $00000040;
  DDOVER_ALPHASRCNEG              = $00000080;
  DDOVER_ALPHASRCSURFACEOVERRIDE  = $00000100;
  DDOVER_HIDE                     = $00000200;
  DDOVER_KEYDEST                  = $00000400;
  DDOVER_KEYDESTOVERRIDE          = $00000800;
  DDOVER_KEYSRC                   = $00001000;
  DDOVER_KEYSRCOVERRIDE           = $00002000;
  DDOVER_SHOW                     = $00004000;
  DDOVER_ADDDIRTYRECT             = $00008000;
  DDOVER_REFRESHDIRTYRECTS        = $00010000;
  DDOVER_REFRESHALL               = $00020000;
  DDOVER_DDFX                     = $00080000;
  DDOVER_AUTOFLIP                 = $00100000;
  DDOVER_BOB                      = $00200000;
  DDOVER_OVERRIDEBOBWEAVE         = $00400000;
  DDOVER_INTERLEAVED              = $00800000;
  DDOVER_BOBHARDWARE              = $01000000;

{ DirectDrawSurface Lock Flags }

  DDLOCK_SURFACEMEMORYPTR  = $00000000;    // default
  DDLOCK_WAIT              = $00000001;
  DDLOCK_EVENT             = $00000002;
  DDLOCK_READONLY          = $00000010;
  DDLOCK_WRITEONLY         = $00000020;
  DDLOCK_NOSYSLOCK         = $00000800;

{ DirectDrawSurface Blt FX Flags }

  DDBLTFX_ARITHSTRETCHY    = $00000001;
  DDBLTFX_MIRRORLEFTRIGHT  = $00000002;
  DDBLTFX_MIRRORUPDOWN     = $00000004;
  DDBLTFX_NOTEARING        = $00000008;
  DDBLTFX_ROTATE180        = $00000010;
  DDBLTFX_ROTATE270        = $00000020;
  DDBLTFX_ROTATE90         = $00000040;
  DDBLTFX_ZBUFFERRANGE     = $00000080;
  DDBLTFX_ZBUFFERBASEDEST  = $00000100;

{ DirectDrawSurface Overlay FX Flags }

  DDOVERFX_ARITHSTRETCHY   = $00000001;
  DDOVERFX_MIRRORLEFTRIGHT = $00000002;
  DDOVERFX_MIRRORUPDOWN    = $00000004;

{ Flags for dwDDFX member of DDSPRITEFX structure }

  DDSPRITEFX_AFFINETRANSFORM    = $00000001;
  DDSPRITEFX_RGBASCALING        = $00000002;
  DDSPRITEFX_DEGRADERGBASCALING = $00000004;
  DDSPRITEFX_BILINEARFILTER     = $00000008;
  DDSPRITEFX_BLURFILTER         = $00000010;
  DDSPRITEFX_FLATFILTER         = $00000020;
  DDSPRITEFX_DEGRADEFILTER      = $00000040;

{ DirectDraw WaitForVerticalBlank Flags }

  DDWAITVB_BLOCKBEGIN      = $00000001;
  DDWAITVB_BLOCKBEGINEVENT = $00000002;
  DDWAITVB_BLOCKEND        = $00000004;

{ DirectDraw GetFlipStatus Flags }

  DDGFS_CANFLIP    = $00000001;
  DDGFS_ISFLIPDONE = $00000002;

{ DirectDraw GetBltStatus Flags }

  DDGBS_CANBLT     = $00000001;
  DDGBS_ISBLTDONE  = $00000002;

{ DirectDraw EnumOverlayZOrder Flags }

  DDENUMOVERLAYZ_BACKTOFRONT = $00000000;
  DDENUMOVERLAYZ_FRONTTOBACK = $00000001;

{ DirectDraw UpdateOverlayZOrder Flags }

  DDOVERZ_SENDTOFRONT     = $00000000;
  DDOVERZ_SENDTOBACK      = $00000001;
  DDOVERZ_MOVEFORWARD     = $00000002;
  DDOVERZ_MOVEBACKWARD    = $00000003;
  DDOVERZ_INSERTINFRONTOF = $00000004;
  DDOVERZ_INSERTINBACKOF  = $00000005;

{ DirectDrawSurface SetPrivateData Constants }

  DDSPD_IUNKNOWNPOINTER   = $00000001;
  DDSPD_VOLATILE          = $00000001;

{ TDDColorControl flags }

  DDCOLOR_BRIGHTNESS    = $00000001;
  DDCOLOR_CONTRAST      = $00000002;
  DDCOLOR_HUE           = $00000004;
  DDCOLOR_SATURATION    = $00000008;
  DDCOLOR_SHARPNESS     = $00000010;
  DDCOLOR_GAMMA         = $00000020;
  DDCOLOR_COLORENABLE   = $00000040;

{ DirectDraw SetGammaRamp Flags }

  DDSGR_CALIBRATE = $00000001;

{ DirectDraw Return Codes }

  DD_OK                                   = 0;
  DD_FALSE                                = S_FALSE;

{ DirectDraw EnumCallback Return Values }

  DDENUMRET_CANCEL = 0;
  DDENUMRET_OK     = 1;

{ DirectDraw Error Codes }

  DDERR_ALREADYINITIALIZED                = $88760000 + 5;
  DDERR_CANNOTATTACHSURFACE               = $88760000 + 10;
  DDERR_CANNOTDETACHSURFACE               = $88760000 + 20;
  DDERR_CURRENTLYNOTAVAIL                 = $88760000 + 40;
  DDERR_EXCEPTION                         = $88760000 + 55;
  DDERR_GENERIC                           = E_FAIL;
  DDERR_HEIGHTALIGN                       = $88760000 + 90;
  DDERR_INCOMPATIBLEPRIMARY               = $88760000 + 95;
  DDERR_INVALIDCAPS                       = $88760000 + 100;
  DDERR_INVALIDCLIPLIST                   = $88760000 + 110;
  DDERR_INVALIDMODE                       = $88760000 + 120;
  DDERR_INVALIDOBJECT                     = $88760000 + 130;
  DDERR_INVALIDPARAMS                     = E_INVALIDARG;
  DDERR_INVALIDPIXELFORMAT                = $88760000 + 145;
  DDERR_INVALIDRECT                       = $88760000 + 150;
  DDERR_LOCKEDSURFACES                    = $88760000 + 160;
  DDERR_NO3D                              = $88760000 + 170;
  DDERR_NOALPHAHW                         = $88760000 + 180;
  DDERR_NOCLIPLIST                        = $88760000 + 205;
  DDERR_NOCOLORCONVHW                     = $88760000 + 210;
  DDERR_NOCOOPERATIVELEVELSET             = $88760000 + 212;
  DDERR_NOCOLORKEY                        = $88760000 + 215;
  DDERR_NOCOLORKEYHW                      = $88760000 + 220;
  DDERR_NODIRECTDRAWSUPPORT               = $88760000 + 222;
  DDERR_NOEXCLUSIVEMODE                   = $88760000 + 225;
  DDERR_NOFLIPHW                          = $88760000 + 230;
  DDERR_NOGDI                             = $88760000 + 240;
  DDERR_NOMIRRORHW                        = $88760000 + 250;
  DDERR_NOTFOUND                          = $88760000 + 255;
  DDERR_NOOVERLAYHW                       = $88760000 + 260;
  DDERR_OVERLAPPINGRECTS                  = $88760000 + 270;
  DDERR_NORASTEROPHW                      = $88760000 + 280;
  DDERR_NOROTATIONHW                      = $88760000 + 290;
  DDERR_NOSTRETCHHW                       = $88760000 + 310;
  DDERR_NOT4BITCOLOR                      = $88760000 + 316;
  DDERR_NOT4BITCOLORINDEX                 = $88760000 + 317;
  DDERR_NOT8BITCOLOR                      = $88760000 + 320;
  DDERR_NOTEXTUREHW                       = $88760000 + 330;
  DDERR_NOVSYNCHW                         = $88760000 + 335;
  DDERR_NOZBUFFERHW                       = $88760000 + 340;
  DDERR_NOZOVERLAYHW                      = $88760000 + 350;
  DDERR_OUTOFCAPS                         = $88760000 + 360;
  DDERR_OUTOFMEMORY                       = E_OUTOFMEMORY;
  DDERR_OUTOFVIDEOMEMORY                  = $88760000 + 380;
  DDERR_OVERLAYCANTCLIP                   = $88760000 + 382;
  DDERR_OVERLAYCOLORKEYONLYONEACTIVE      = $88760000 + 384;
  DDERR_PALETTEBUSY                       = $88760000 + 387;
  DDERR_COLORKEYNOTSET                    = $88760000 + 400;
  DDERR_SURFACEALREADYATTACHED            = $88760000 + 410;
  DDERR_SURFACEALREADYDEPENDENT           = $88760000 + 420;
  DDERR_SURFACEBUSY                       = $88760000 + 430;
  DDERR_CANTLOCKSURFACE                   = $88760000 + 435;
  DDERR_SURFACEISOBSCURED                 = $88760000 + 440;
  DDERR_SURFACELOST                       = $88760000 + 450;
  DDERR_SURFACENOTATTACHED                = $88760000 + 460;
  DDERR_TOOBIGHEIGHT                      = $88760000 + 470;
  DDERR_TOOBIGSIZE                        = $88760000 + 480;
  DDERR_TOOBIGWIDTH                       = $88760000 + 490;
  DDERR_UNSUPPORTED                       = E_NOTIMPL;
  DDERR_UNSUPPORTEDFORMAT                 = $88760000 + 510;
  DDERR_UNSUPPORTEDMASK                   = $88760000 + 520;
  DDERR_INVALIDSTREAM                     = $88760000 + 521;
  DDERR_VERTICALBLANKINPROGRESS           = $88760000 + 537;
  DDERR_WASSTILLDRAWING                   = $88760000 + 540;
  DDERR_XALIGN                            = $88760000 + 560;
  DDERR_INVALIDDIRECTDRAWGUID             = $88760000 + 561;
  DDERR_DIRECTDRAWALREADYCREATED          = $88760000 + 562;
  DDERR_NODIRECTDRAWHW                    = $88760000 + 563;
  DDERR_PRIMARYSURFACEALREADYEXISTS       = $88760000 + 564;
  DDERR_NOEMULATION                       = $88760000 + 565;
  DDERR_REGIONTOOSMALL                    = $88760000 + 566;
  DDERR_CLIPPERISUSINGHWND                = $88760000 + 567;
  DDERR_NOCLIPPERATTACHED                 = $88760000 + 568;
  DDERR_NOHWND                            = $88760000 + 569;
  DDERR_HWNDSUBCLASSED                    = $88760000 + 570;
  DDERR_HWNDALREADYSET                    = $88760000 + 571;
  DDERR_NOPALETTEATTACHED                 = $88760000 + 572;
  DDERR_NOPALETTEHW                       = $88760000 + 573;
  DDERR_BLTFASTCANTCLIP                   = $88760000 + 574;
  DDERR_NOBLTHW                           = $88760000 + 575;
  DDERR_NODDROPSHW                        = $88760000 + 576;
  DDERR_OVERLAYNOTVISIBLE                 = $88760000 + 577;
  DDERR_NOOVERLAYDEST                     = $88760000 + 578;
  DDERR_INVALIDPOSITION                   = $88760000 + 579;
  DDERR_NOTAOVERLAYSURFACE                = $88760000 + 580;
  DDERR_EXCLUSIVEMODEALREADYSET           = $88760000 + 581;
  DDERR_NOTFLIPPABLE                      = $88760000 + 582;
  DDERR_CANTDUPLICATE                     = $88760000 + 583;
  DDERR_NOTLOCKED                         = $88760000 + 584;
  DDERR_CANTCREATEDC                      = $88760000 + 585;
  DDERR_NODC                              = $88760000 + 586;
  DDERR_WRONGMODE                         = $88760000 + 587;
  DDERR_IMPLICITLYCREATED                 = $88760000 + 588;
  DDERR_NOTPALETTIZED                     = $88760000 + 589;
  DDERR_UNSUPPORTEDMODE                   = $88760000 + 590;
  DDERR_NOMIPMAPHW                        = $88760000 + 591;
  DDERR_INVALIDSURFACETYPE                = $88760000 + 592;
  DDERR_NOOPTIMIZEHW                      = $88760000 + 600;
  DDERR_NOTLOADED                         = $88760000 + 601;
  DDERR_NOFOCUSWINDOW                     = $88760000 + 602;
  DDERR_DCALREADYCREATED                  = $88760000 + 620;
  DDERR_NONONLOCALVIDMEM                  = $88760000 + 630;
  DDERR_CANTPAGELOCK                      = $88760000 + 640;
  DDERR_CANTPAGEUNLOCK                    = $88760000 + 660;
  DDERR_NOTPAGELOCKED                     = $88760000 + 680;
  DDERR_MOREDATA                          = $88760000 + 690;
  DDERR_EXPIRED                           = $88760000 + 691;
  DDERR_VIDEONOTACTIVE                    = $88760000 + 695;
  DDERR_DEVICEDOESNTOWNSURFACE            = $88760000 + 699;
  DDERR_NOTINITIALIZED                    = CO_E_NOTINITIALIZED;

{ API's }

type
  HMonitor = THandle;

  TDDEnumCallbackA = function(lpGUID: PGUID; lpDriverDescription: LPSTR;
    lpDriverName: LPSTR; lpContext: Pointer): BOOL; stdcall;
  LPDDENUMCALLBACKA = TDDEnumCallbackA;

  TDDEnumCallbackW = function(lpGUID: PGUID; lpDriverDescription: LPWSTR;
    lpDriverName: LPWSTR; lpContext: Pointer): BOOL; stdcall;
  LPDDENUMCALLBACKW = TDDEnumCallbackW;

  TDDEnumCallback = TDDEnumCallbackA;
  LPDDENUMCALLBACK = TDDEnumCallback;

  TDDEnumCallbackExA = function(lpGUID: PGUID; lpDriverDescription: LPSTR;
    lpDriverName: LPSTR; lpContext: Pointer; Monitor: HMonitor): BOOL; stdcall;
  LPDDENUMCALLBACKEXA = TDDEnumCallbackExA;

  TDDEnumCallbackExW = function(lpGUID: PGUID; lpDriverDescription: LPWSTR;
    lpDriverName: LPWSTR; lpContext: Pointer; Monitor: HMonitor): BOOL; stdcall;
  LPDDENUMCALLBACKEXW = TDDEnumCallbackExW;

  TDDEnumCallbackEx = TDDEnumCallbackExA;
  LPDDENUMCALLBACKEX = TDDEnumCallbackEx;

const
  REGSTR_KEY_DDHW_DESCRIPTION = 'Description';
  REGSTR_KEY_DDHW_DRIVERNAME  = 'DriverName';
  REGSTR_PATH_DDHW            = 'Hardware\DirectDrawDrivers';

  DDCREATE_HARDWAREONLY       = $00000001;
  DDCREATE_EMULATIONONLY      = $00000002;

function DirectDrawEnumerateA(lpCallback: TDDEnumCallbackA; lpContext: Pointer): HResult; stdcall;
function DirectDrawEnumerateW(lpCallback: TDDEnumCallbackW; lpContext: Pointer): HResult; stdcall;
function DirectDrawEnumerate(lpCallback: TDDEnumCallbackA; lpContext: Pointer): HResult; stdcall;

function DirectDrawEnumerateExA(lpCallback: TDDEnumCallbackExA; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
function DirectDrawEnumerateExW(lpCallback: TDDEnumCallbackExW; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
function DirectDrawEnumerateEx(lpCallback: TDDEnumCallbackExA; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;

function DirectDrawCreate(lpGUID: PGUID; out lplpDD: IDirectDraw;
  pUnkOuter: IUnknown): HResult; stdcall;
function DirectDrawCreateClipper(dwFlags: DWORD; out lplpDDClipper: IDirectDrawClipper;
  pUnkOuter: IUnknown): HResult; stdcall;

(*==========================================================================;
 *
 *  Copyright (C) 1996-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dvp.h
 *  Content:    DirectDrawVideoPort include file
 *
 ***************************************************************************)

{ GUIDS used by DirectDrawVideoPort objects }

const
  IID_IDDVideoPortContainer: TGUID = '{6C142760-A733-11CE-A521-0020AF0BE560}';
  IID_IDirectDrawVideoPort: TGUID = '{B36D93E0-2B43-11CF-A2DE-00AA00B93356}';

  DDVPTYPE_E_HREFH_VREFH: TGUID = '{54F39980-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_E_HREFH_VREFL: TGUID = '{92783220-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_E_HREFL_VREFH: TGUID = '{A07A02E0-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_E_HREFL_VREFL: TGUID = '{E09C77E0-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_CCIR656: TGUID = '{FCA326A0-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_BROOKTREE: TGUID = '{1352A560-DA61-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_PHILIPS: TGUID = '{332CF160-DA61-11CF-9B06-00A0C903A3B8}';

{ DirectDraw Structures }

type
  IDDVideoPortContainer = interface;
  IDirectDrawVideoPort = interface;

{ TDDVideoportConnect structure }

  PDDVideoportConnect = ^TDDVideoportConnect;
  TDDVideoportConnect = record
    dwSize: DWORD;        // size of the TDDVideoportConnect structure
    dwPortWidth: DWORD;   // Width of the video port
    guidTypeID: TGUID;    // Description of video port connection
    dwFlags: DWORD;       // Connection flags
    dwReserved1: DWORD;   // Reserved, set to zero.
  end;

  DDVIDEOPORTCONNECT = TDDVideoportConnect;
  LPDDVIDEOPORTCONNECT = PDDVideoportConnect;

{ TDDVideoportCaps structure }

  PDDVideoportCaps = ^TDDVideoportCaps;
  TDDVideoportCaps = record
    dwSize: DWORD;                          // size of the TDDVideoportCaps structure
    dwFlags: DWORD;                         // indicates which fields contain data
    dwMaxWidth: DWORD;                      // max width of the video port field
    dwMaxVBIWidth: DWORD;                   // max width of the VBI data
    dwMaxHeight: DWORD;                     // max height of the video port field
    dwVideoPortID: DWORD;                   // Video port ID (0 - (dwMaxVideoPorts -1))
    dwCaps: DWORD;                          // Video port capabilities
    dwFX: DWORD;                            // More video port capabilities
    dwNumAutoFlipSurfaces: DWORD;           // Number of autoflippable surfaces
    dwAlignVideoPortBoundary: DWORD;        // Byte restriction of placement within the surface
    dwAlignVideoPortPrescaleWidth: DWORD;   // Byte restriction of width after prescaling
    dwAlignVideoPortCropBoundary: DWORD;    // Byte restriction of left cropping
    dwAlignVideoPortCropWidth: DWORD;       // Byte restriction of cropping width
    dwPreshrinkXStep: DWORD;                // Width can be shrunk in steps of 1/x
    dwPreshrinkYStep: DWORD;                // Height can be shrunk in steps of 1/x
    dwNumVBIAutoFlipSurfaces: DWORD;        // Number of VBI autoflippable surfaces
    dwNumPreferredAutoflip: DWORD;          // Optimal number of autoflippable surfaces for hardware
    wNumFilterTapsX: WORD;                  // Number of taps the prescaler uses in the X direction (0 - no prescale, 1 - replication, etc.)
    wNumFilterTapsY: WORD;                  // Number of taps the prescaler uses in the Y direction (0 - no prescale, 1 - replication, etc.)
  end;

  DDVIDEOPORTCAPS = TDDVideoportCaps;
  LPDDVIDEOPORTCAPS = PDDVideoportCaps;

{ TDDVideoportDesc structure }

  PDDVideoportDesc = ^TDDVideoportDesc;
  TDDVideoportDesc = record
    dwSize: DWORD;                       // size of the TDDVideoportDesc structure
    dwFieldWidth: DWORD;                 // width of the video port field
    dwVBIWidth: DWORD;                   // width of the VBI data
    dwFieldHeight: DWORD;                // height of the video port field
    dwMicrosecondsPerField: DWORD;       // Microseconds per video field
    dwMaxPixelsPerSecond: DWORD;         // Maximum pixel rate per second
    dwVideoPortID: DWORD;                // Video port ID (0 - (dwMaxVideoPorts -1))
    dwReserved1: DWORD;                  // Reserved for future use - set to zero
    VideoPortType: TDDVideoportConnect;   // Description of video port connection
    dwReserved2: DWORD;                  // Reserved for future use - set to zero
    dwReserved3: DWORD;                  // Reserved for future use - set to zero
  end;

  DDVIDEOPORTDESC = TDDVideoportDesc;
  LPDDVIDEOPORTDESC = PDDVideoportDesc;

{ TDDVideoportInfo structure }

  PDDVideoportInfo = ^TDDVideoportInfo;
  TDDVideoportInfo = record
    dwSize: DWORD;                            // Size of the structure
    dwOriginX: DWORD;                         // Placement of the video data within the surface.
    dwOriginY: DWORD;                         // Placement of the video data within the surface.
    dwVPFlags: DWORD;                         // Video port options
    rCrop: TRect;                             // Cropping rectangle (optional).
    dwPrescaleWidth: DWORD;                   // Determines pre-scaling/zooming in the X direction (optional).
    dwPrescaleHeight: DWORD;                  // Determines pre-scaling/zooming in the Y direction (optional).
    lpddpfInputFormat: PDDPixelFormat;        // Video format written to the video port
    lpddpfVBIInputFormat: PDDPixelFormat;     // Input format of the VBI data
    lpddpfVBIOutputFormat: PDDPixelFormat;    // Output format of the data
    dwVBIHeight: DWORD;                       // Specifies the number of lines of data within the vertical blanking interval.
    dwReserved1: DWORD;                       // Reserved for future use - set to zero
    dwReserved2: DWORD;                       // Reserved for future use - set to zero
  end;

  DDVIDEOPORTINFO = TDDVideoportInfo;
  LPDDVIDEOPORTINFO = PDDVideoportInfo;

{ TDDVideoportBandWidth structure }

  PDDVideoportBandWidth = ^TDDVideoportBandWidth;
  TDDVideoportBandWidth = record
    dwSize: DWORD;                 // Size of the structure
    dwCaps: DWORD;
    dwOverlay: DWORD;              // Zoom factor at which overlay is supported
    dwColorkey: DWORD;             // Zoom factor at which overlay w/ colorkey is supported
    dwYInterpolate: DWORD;         // Zoom factor at which overlay w/ Y interpolation is supported
    dwYInterpAndColorkey: DWORD;   // Zoom factor at which ovelray w/ Y interpolation and colorkeying is supported
    dwReserved1: DWORD;            // Reserved for future use - set to zero
    dwReserved2: DWORD;            // Reserved for future use - set to zero
  end;

  DDVIDEOPORTBANDWIDTH = TDDVideoportBandWidth;
  LPDDVIDEOPORTBANDWIDTH = PDDVideoportBandWidth;

{ TDDVideoportStatus structure }

  PDDVideoportStatus = ^TDDVideoportStatus;
  TDDVideoportStatus = record
    dwSize: DWORD;                       // Size of the structure
    bInUse: BOOL;                        // TRUE if video port is currently being used
    dwFlags: DWORD;                      // Currently not used
    dwReserved1: DWORD;                  // Reserved for future use
    VideoPortType: TDDVideoportConnect;   // Information about the connection
    dwReserved2: DWORD;                  // Reserved for future use
    dwReserved3: DWORD;                  // Reserved for future use
  end;

  DDVIDEOPORTSTATUS = TDDVideoportStatus;
  LPDDVIDEOPORTSTATUS = PDDVideoportStatus;

{ API's }

  TDDEnumVideoCallback = function(const lpDDVideoPortCaps: TDDVideoportCaps;
      lpContext: Pointer): HResult; stdcall;
  LPDDENUMVIDEOCALLBACK = TDDEnumVideoCallback;

{ IDirectDrawVideoPortContainer Interface }

  IDDVideoPortContainer = interface(IUnknown)
    ['{6C142760-A733-11CE-A521-0020AF0BE560}']
    // IDDVideoPortContainer methods
    function CreateVideoPort(dwFlags: DWORD; const lpDDVideoPortDesc:
        TDDVideoportDesc; out lplpDDVideoPort: IDirectDrawVideoPort;
        pUnkOuter: IUnknown): HResult; stdcall;
    function EnumVideoPorts(dwFlags: DWORD;
        const lpDDVideoPortCaps: TDDVideoportCaps; lpContext: Pointer;
        lpEnumVideoCallback: TDDEnumVideoCallback): HResult; stdcall;
    function GetVideoPortConnectInfo(dwPortId: DWORD; var lpNumEntries: DWORD;
        var lpConnectInfo: TDDVideoportConnect): HResult; stdcall;
    function QueryVideoPortStatus(dwPortId: DWORD;
        var lpVPStatus: TDDVideoportStatus): HResult; stdcall;
  end;

{ IDirectDrawVideoPort Interface }

  IDirectDrawVideoPort = interface(IUnknown)
    ['{B36D93E0-2B43-11CF-A2DE-00AA00B93356}']
    // IDirectDrawVideoPort methods
    function Flip(lpDDSurface: IDirectDrawSurface; dwFlags: DWORD): HResult; stdcall;
    function GetBandwidthInfo(const lpddpfFormat: TDDPixelFormat; dwWidth: DWORD;
        dwHeight: DWORD; dwFlags: DWORD; var lpBandwidth: TDDVideoportBandWidth): HResult; stdcall;
    function GetColorControls(var lpColorControl: TDDColorControl): HResult; stdcall;
    function GetInputFormats(var lpNumFormats: DWORD; var lpFormats:
        TDDPixelFormat; dwFlags: DWORD): HResult; stdcall;
    function GetOutputFormats(const lpInputFormat: TDDPixelFormat;
        var lpNumFormats: DWORD; var lpFormats: TDDPixelFormat; dwFlags: DWORD): HResult; stdcall;
    function GetFieldPolarity(var lpbVideoField: BOOL): HResult; stdcall;
    function GetVideoLine(var lpdwLine: DWORD): HResult; stdcall;
    function GetVideoSignalStatus(varlpdwStatus: DWORD): HResult; stdcall;
    function SetColorControls(const lpColorControl: TDDColorControl): HResult; stdcall;
    function SetTargetSurface(lpDDSurface: IDirectDrawSurface; dwFlags: DWORD): HResult; stdcall;
    function StartVideo(const lpVideoInfo: TDDVideoportInfo): HResult; stdcall;
    function StopVideo: HResult; stdcall;
    function UpdateVideo(const lpVideoInfo: TDDVideoportInfo): HResult; stdcall;
    function WaitForSync(dwFlags: DWORD; dwLine: DWORD; dwTimeout: DWORD): HResult; stdcall;
  end;


const
{ Video Port Flags }

  DDVPD_WIDTH             = $00000001;
  DDVPD_HEIGHT            = $00000002;
  DDVPD_ID                = $00000004;
  DDVPD_CAPS              = $00000008;
  DDVPD_FX                = $00000010;
  DDVPD_AUTOFLIP          = $00000020;
  DDVPD_ALIGN             = $00000040;
  DDVPD_PREFERREDAUTOFLIP = $00000080;
  DDVPD_FILTERQUALITY     = $00000100;

{ TDDVideoportConnect flags }

  DDVPCONNECT_DOUBLECLOCK      = $00000001;
  DDVPCONNECT_VACT             = $00000002;
  DDVPCONNECT_INVERTPOLARITY   = $00000004;
  DDVPCONNECT_DISCARDSVREFDATA = $00000008;
  DDVPCONNECT_HALFLINE         = $00000010;
  DDVPCONNECT_INTERLACED       = $00000020;
  DDVPCONNECT_SHAREEVEN        = $00000040;
  DDVPCONNECT_SHAREODD         = $00000080;

{ TDDVideoportDesc caps }

  DDVPCAPS_AUTOFLIP               = $00000001;
  DDVPCAPS_INTERLACED             = $00000002;
  DDVPCAPS_NONINTERLACED          = $00000004;
  DDVPCAPS_READBACKFIELD          = $00000008;
  DDVPCAPS_READBACKLINE           = $00000010;
  DDVPCAPS_SHAREABLE              = $00000020;
  DDVPCAPS_SKIPEVENFIELDS         = $00000040;
  DDVPCAPS_SKIPODDFIELDS          = $00000080;
  DDVPCAPS_SYNCMASTER             = $00000100;
  DDVPCAPS_VBISURFACE             = $00000200;
  DDVPCAPS_COLORCONTROL           = $00000400;
  DDVPCAPS_OVERSAMPLEDVBI         = $00000800;
  DDVPCAPS_SYSTEMMEMORY           = $00001000;
  DDVPCAPS_VBIANDVIDEOINDEPENDENT = $00002000;
  DDVPCAPS_HARDWAREDEINTERLACE    = $00004000;

{ TDDVideoportDesc FX }

  DDVPFX_CROPTOPDATA     = $00000001;
  DDVPFX_CROPX           = $00000002;
  DDVPFX_CROPY           = $00000004;
  DDVPFX_INTERLEAVE      = $00000008;
  DDVPFX_MIRRORLEFTRIGHT = $00000010;
  DDVPFX_MIRRORUPDOWN    = $00000020;
  DDVPFX_PRESHRINKX      = $00000040;
  DDVPFX_PRESHRINKY      = $00000080;
  DDVPFX_PRESHRINKXB     = $00000100;
  DDVPFX_PRESHRINKYB     = $00000200;
  DDVPFX_PRESHRINKXS     = $00000400;
  DDVPFX_PRESHRINKYS     = $00000800;
  DDVPFX_PRESTRETCHX     = $00001000;
  DDVPFX_PRESTRETCHY     = $00002000;
  DDVPFX_PRESTRETCHXN    = $00004000;
  DDVPFX_PRESTRETCHYN    = $00008000;
  DDVPFX_VBICONVERT      = $00010000;
  DDVPFX_VBINOSCALE      = $00020000;
  DDVPFX_IGNOREVBIXCROP  = $00040000;
  DDVPFX_VBINOINTERLEAVE = $00080000;

{ TDDVideoportInfo flags }

  DDVP_AUTOFLIP            = $00000001;
  DDVP_CONVERT             = $00000002;
  DDVP_CROP                = $00000004;
  DDVP_INTERLEAVE          = $00000008;
  DDVP_MIRRORLEFTRIGHT     = $00000010;
  DDVP_MIRRORUPDOWN        = $00000020;
  DDVP_PRESCALE            = $00000040;
  DDVP_SKIPEVENFIELDS      = $00000080;
  DDVP_SKIPODDFIELDS       = $00000100;
  DDVP_SYNCMASTER          = $00000200;
  DDVP_VBICONVERT          = $00000400;
  DDVP_VBINOSCALE          = $00000800;
  DDVP_OVERRIDEBOBWEAVE    = $00001000;
  DDVP_IGNOREVBIXCROP      = $00002000;
  DDVP_HARDWAREDEINTERLACE = $00008000;

{ DirectDrawVideoport GetInputFormat/GetOutputFormat flags }

  DDVPFORMAT_VIDEO = $00000001;
  DDVPFORMAT_VBI = $00000002;

{ DirectDrawVideoport SetTargetSurface flags }

  DDVPTARGET_VIDEO = $00000001;
  DDVPTARGET_VBI = $00000002;

{ DirectDrawVideoport WaitForSync flags }

  DDVPWAIT_BEGIN = $00000001;
  DDVPWAIT_END = $00000002;
  DDVPWAIT_LINE = $00000003;

{ DirectDrawVideoport flip flags }

  DDVPFLIP_VIDEO = $00000001;
  DDVPFLIP_VBI = $00000002;

{ DirectDrawVideoport GetVideoSiginalStatus values }

  DDVPSQ_NOSIGNAL = $00000001;
  DDVPSQ_SIGNALOK = $00000002;

{ TDDVideoportBandWidth Flags }

  DDVPB_VIDEOPORT = $00000001;
  DDVPB_OVERLAY = $00000002;
  DDVPB_TYPE = $00000004;

{ TDDVideoportBandWidth Caps }

  DDVPBCAPS_SOURCE = $00000001;
  DDVPBCAPS_DESTINATION = $00000002;

{ IDDVideoportContainer.CreateVideoPort flags }

  DDVPCREATE_VBIONLY   = $00000001;
  DDVPCREATE_VIDEOONLY = $00000002;

{ TDDVideoportStatus flags }

  DDVPSTATUS_VBIONLY   = $00000001;
  DDVPSTATUS_VIDEOONLY = $00000002;

(*==========================================================================;
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       d3dtypes.h
 *  Content:    Direct3D types include file
 *
 ***************************************************************************)

type
  TD3DValue = Single;
  D3DValue = TD3DValue;

  TD3DFixed = Longint;
  D3DFIXED = TD3DFixed;

  TD3DColor = DWORD;
  D3DCOLOR = TD3DColor;

function D3DVALP(val: TD3DValue; prec: Integer): TD3DValue;
function D3DVAL(val: TD3DValue): TD3DValue;
function D3DDivide(a, b: TD3DValue): TD3DValue;
function D3DMultiply(a, b: TD3DValue): TD3DValue;

(*
 * Format of CI colors is
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |    alpha      |         color index           |   fraction    |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *)

function CI_GETALPHA(ci: Integer): Byte;
function CI_GETINDEX(ci: Integer): Word;
function CI_GETFRACTION(ci: Integer): Byte;
function CI_ROUNDINDEX(ci: Integer): Integer;
function CI_MASKALPHA(ci: Integer): Integer;
function CI_MAKE(a: Byte; i: Word; f: Byte): Integer;

(*
 * Format of RGBA colors is
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |    alpha      |      red      |     green     |     blue      |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *)

function RGBA_GETALPHA(rgb: TD3DColor): Byte;
function RGBA_GETRED(rgb: TD3DColor): Byte;
function RGBA_GETGREEN(rgb: TD3DColor): Byte;
function RGBA_GETBLUE(rgb: TD3DColor): Byte;
function RGBA_MAKE(r, g, b, a: Byte): TD3DColor;

(* D3DRGB and D3DRGBA may be used as initialisers for D3DCOLORs
 * The float values must be in the range 0..1
 *)

function D3DRGB(r, g, b: TD3DValue): TD3DColor;
function D3DRGBA(r, g, b, a: TD3DValue): TD3DColor;

(*
 * Format of RGB colors is
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *  |    ignored    |      red      |     green     |     blue      |
 *  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 *)

function RGB_GETRED(rgb: TD3DColor): Byte;
function RGB_GETGREEN(rgb: TD3DColor): Byte;
function RGB_GETBLUE(rgb: TD3DColor): Byte;
function RGBA_SETALPHA(rgba: TD3DColor; x: Byte): TD3DColor;
function RGB_MAKE(r, g, b: Byte): TD3DColor;
function RGBA_TORGB(rgba: TD3DColor): TD3DColor;
function RGB_TORGBA(rgb: TD3DColor): TD3DColor;

const
{ Flags for Enumerate functions }

  D3DENUMRET_CANCEL = DDENUMRET_CANCEL;
  D3DENUMRET_OK     = DDENUMRET_OK;

type
  TD3DValidateCallback = function(lpUserArg: Pointer; dwOffset: DWORD): HResult; stdcall;
  LPD3DVALIDATECALLBACK = TD3DValidateCallback;

  TD3DEnumTextureFormatsCalback = function(const lpDdsd: TDDSurfaceDesc;
      lpContext: Pointer): HResult; stdcall;
  LPD3DENUMTEXTUREFORMATSCALLBACK = TD3DEnumTextureFormatsCalback;

  TD3DEnumPixelFormatsCallback = function(const lpDDPixFmt: TDDPixelFormat;
      lpContext: Pointer): HResult; stdcall;

  TD3DMaterialHandle = DWORD;
  D3DMATERIALHANDLE = TD3DMaterialHandle;

  TD3DTextureHandle = DWORD;
  D3DTEXTUREHANDLE = TD3DTextureHandle;

  TD3DMatrixHandle = DWORD;
  D3DMATRIXHANDLE = TD3DMatrixHandle;

{ TD3DColorValue structure }

  PD3DColorValue = ^TD3DColorValue;
  TD3DColorValue = record
    case Integer of
    0: (
      r: TD3DValue;
      g: TD3DValue;
      b: TD3DValue;
      a: TD3DValue;
      );
    1: (
      dvR: TD3DValue;
      dvG: TD3DValue;
      dvB: TD3DValue;
      dvA: TD3DValue;
      );
  end;

  D3DCOLORVALUE = TD3DColorValue;

{ TD3DRect structure }

  PD3DRect = ^TD3DRect;
  TD3DRect = record
    case Integer of
    0: (
      x1: Longint;
      y1: Longint;
      x2: Longint;
      y2: Longint;
      );
    1: (
      lX1: Longint;
      lY1: Longint;
      lX2: Longint;
      lY2: Longint;
      );
  end;

  D3DRECT = TD3DRect;
  LPD3DRECT = PD3DRect;

{ TD3DVector structure }

  PD3DVector = ^TD3DVector;
  TD3DVector = record
    case Integer of
    0: (
      x: TD3DValue;
      y: TD3DValue;
      z: TD3DValue;
      );
    1: (
      dvX: TD3DValue;
      dvY: TD3DValue;
      dvZ: TD3DValue;
      );
  end;

  D3DVECTOR = TD3DVector;
  LPD3DVECTOR = PD3DVector;

// Addition and subtraction
function VectorAdd(v1, v2: TD3DVector) : TD3DVector;
function VectorSub(v1, v2: TD3DVector) : TD3DVector;
// Scalar multiplication and division
function VectorMulS(v: TD3DVector; s: TD3DValue) : TD3DVector;
function VectorDivS(v: TD3DVector; s: TD3DValue) : TD3DVector;
// Memberwise multiplication and division
function VectorMul(v1, v2: TD3DVector) : TD3DVector;
function VectorDiv(v1, v2: TD3DVector) : TD3DVector;
// Vector dominance
function VectorSmaller(v1, v2: TD3DVector) : boolean;
function VectorSmallerEquel(v1, v2: TD3DVector) : boolean;
// Bitwise equality
function VectorEquel(v1, v2: TD3DVector) : boolean;
// Length-related functions
function VectorSquareMagnitude(v: TD3DVector) : TD3DValue;
function VectorMagnitude(v: TD3DVector) : TD3DValue;
// Returns vector with same direction and unit length
function VectorNormalize(v: TD3DVector) : TD3DVector;
// Return min/max component of the input vector
function VectorMin(v: TD3DVector) : TD3DValue;
function VectorMax(v: TD3DVector) : TD3DValue;
// Return memberwise min/max of input vectors
function VectorMinimize(v1, v2: TD3DVector) : TD3DVector;
function VectorMaximize(v1, v2: TD3DVector) : TD3DVector;
// Dot and cross product
function VectorDotProduct(v1, v2: TD3DVector) : TD3DValue;
function VectorCrossProduct(v1, v2: TD3DVector) : TD3DVector;

type
{ Vertex data types supported in an ExecuteBuffer. }

{ TD3DHVertex structure }

  PD3DHVertex = ^TD3DHVertex;
  TD3DHVertex = record
    dwFlags: DWORD;        // Homogeneous clipping flags
    case Integer of
    0: (
      hx: TD3DValue;
      hy: TD3DValue;
      hz: TD3DValue;
      );
    1: (
      dvHX: TD3DValue;
      dvHY: TD3DValue;
      dvHZ: TD3DValue;
      );
  end;

  D3DHVERTEX = TD3DHVertex;

{ TD3DTLVertex structure }

  PD3DTLVertex = ^TD3DTLVertex;
  TD3DTLVertex = record
    case Integer of
    0: (
      sx: TD3DValue;             // Screen coordinates
      sy: TD3DValue;
      sz: TD3DValue;
      rhw: TD3DValue;            // Reciprocal of homogeneous w
      color: TD3DColor;          // Vertex color
      specular: TD3DColor;       // Specular component of vertex
      tu: TD3DValue;             // Texture coordinates
      tv: TD3DValue;
      );
    1: (
      dvSX: TD3DValue;
      dvSY: TD3DValue;
      dvSZ: TD3DValue;
      dvRHW: TD3DValue;
      dcColor: TD3DColor;
      dcSpecular: TD3DColor;
      dvTU: TD3DValue;
      dvTV: TD3DValue;
      );
  end;

  D3DTLVERTEX = TD3DTLVertex;

{ TD3DLVertex structure }

  PD3DLVertex = ^TD3DLVertex;
  TD3DLVertex = record
    case Integer of
    0: (
      x: TD3DValue;             // Homogeneous coordinates
      y: TD3DValue;
      z: TD3DValue;
      dwReserved: DWORD;
      color: TD3DColor;         // Vertex color
      specular: TD3DColor;      // Specular component of vertex
      tu: TD3DValue;            // Texture coordinates
      tv: TD3DValue;
      );
    1: (
      dvX: TD3DValue;
      dvY: TD3DValue;
      dvZ: TD3DValue;
      _union1d: DWORD;
      dcColor: TD3DColor;
      dcSpecular: TD3DColor;
      dvTU: TD3DValue;
      dvTV: TD3DValue;
      );
  end;

  D3DLVERTEX = TD3DLVertex;

{ TD3DVertex structure }

  PD3DVertex = ^TD3DVertex;
  TD3DVertex = record
    case Integer of
    0: (
      x: TD3DValue;             // Homogeneous coordinates
      y: TD3DValue;
      z: TD3DValue;
      nx: TD3DValue;            // Normal
      ny: TD3DValue;
      nz: TD3DValue;
      tu: TD3DValue;            // Texture coordinates
      tv: TD3DValue;
      );
    1: (
      dvX: TD3DValue;
      dvY: TD3DValue;
      dvZ: TD3DValue;
      dvNX: TD3DValue;
      dvNY: TD3DValue;
      dvNZ: TD3DValue;
      dvTU: TD3DValue;
      dvTV: TD3DValue;
      );
  end;

  D3DVERTEX = TD3DVertex;

{ TD3DMatrix structure }

  PD3DMatrix = ^TD3DMatrix;
  TD3DMatrix = record
    _11, _12, _13, _14: TD3DValue;
    _21, _22, _23, _24: TD3DValue;
    _31, _32, _33, _34: TD3DValue;
    _41, _42, _43, _44: TD3DValue;
  end;

  D3DMATRIX = TD3DMatrix;

{ TD3DViewport structure }

  PD3DViewport = ^TD3DViewport;
  TD3DViewport = record
    dwSize: DWORD;
    dwX: DWORD;
    dwY: DWORD;               // Top left
    dwWidth: DWORD;
    dwHeight: DWORD;          // Dimensions
    dvScaleX: TD3DValue;       // Scale homogeneous to screen
    dvScaleY: TD3DValue;       // Scale homogeneous to screen
    dvMaxX: TD3DValue;         // Min/max homogeneous x coord
    dvMaxY: TD3DValue;         // Min/max homogeneous y coord
    dvMinZ: TD3DValue;
    dvMaxZ: TD3DValue;         // Min/max homogeneous z coord
  end;

  D3DVIEWPORT = TD3DViewport;

{ TD3DViewport2 structure }

  PD3DViewport2 = ^TD3DViewport2;
  TD3DViewport2 = record
    dwSize: DWORD;
    dwX: DWORD;
    dwY: DWORD;               // Top left
    dwWidth: DWORD;
    dwHeight: DWORD;          // Dimensions
    dvClipX: TD3DValue;        // Top left of clip volume
    dvClipY: TD3DValue;
    dvClipWidth: TD3DValue;    // Clip Volume Dimensions
    dvClipHeight: TD3DValue;
    dvMinZ: TD3DValue;
    dvMaxZ: TD3DValue;         // Min/max homogeneous z coord
  end;

  D3DVIEWPORT2 = TD3DViewport2;

{ Values for clip fields. }

const
  D3DCLIP_LEFT   = $00000001;
  D3DCLIP_RIGHT  = $00000002;
  D3DCLIP_TOP    = $00000004;
  D3DCLIP_BOTTOM = $00000008;
  D3DCLIP_FRONT  = $00000010;
  D3DCLIP_BACK   = $00000020;
  D3DCLIP_GEN0   = $00000040;
  D3DCLIP_GEN1   = $00000080;
  D3DCLIP_GEN2   = $00000100;
  D3DCLIP_GEN3   = $00000200;
  D3DCLIP_GEN4   = $00000400;
  D3DCLIP_GEN5   = $00000800;

{ Values for d3d status. }

  D3DSTATUS_CLIPUNIONLEFT   = D3DCLIP_LEFT;
  D3DSTATUS_CLIPUNIONRIGHT  = D3DCLIP_RIGHT;
  D3DSTATUS_CLIPUNIONTOP    = D3DCLIP_TOP;
  D3DSTATUS_CLIPUNIONBOTTOM = D3DCLIP_BOTTOM;
  D3DSTATUS_CLIPUNIONFRONT  = D3DCLIP_FRONT;
  D3DSTATUS_CLIPUNIONBACK   = D3DCLIP_BACK;
  D3DSTATUS_CLIPUNIONGEN0   = D3DCLIP_GEN0;
  D3DSTATUS_CLIPUNIONGEN1   = D3DCLIP_GEN1;
  D3DSTATUS_CLIPUNIONGEN2   = D3DCLIP_GEN2;
  D3DSTATUS_CLIPUNIONGEN3   = D3DCLIP_GEN3;
  D3DSTATUS_CLIPUNIONGEN4   = D3DCLIP_GEN4;
  D3DSTATUS_CLIPUNIONGEN5   = D3DCLIP_GEN5;

  D3DSTATUS_CLIPINTERSECTIONLEFT   = $00001000;
  D3DSTATUS_CLIPINTERSECTIONRIGHT  = $00002000;
  D3DSTATUS_CLIPINTERSECTIONTOP    = $00004000;
  D3DSTATUS_CLIPINTERSECTIONBOTTOM = $00008000;
  D3DSTATUS_CLIPINTERSECTIONFRONT  = $00010000;
  D3DSTATUS_CLIPINTERSECTIONBACK   = $00020000;
  D3DSTATUS_CLIPINTERSECTIONGEN0   = $00040000;
  D3DSTATUS_CLIPINTERSECTIONGEN1   = $00080000;
  D3DSTATUS_CLIPINTERSECTIONGEN2   = $00100000;
  D3DSTATUS_CLIPINTERSECTIONGEN3   = $00200000;
  D3DSTATUS_CLIPINTERSECTIONGEN4   = $00400000;
  D3DSTATUS_CLIPINTERSECTIONGEN5   = $00800000;
  D3DSTATUS_ZNOTVISIBLE            = $01000000;

  D3DSTATUS_CLIPUNIONALL =
    D3DSTATUS_CLIPUNIONLEFT or
    D3DSTATUS_CLIPUNIONRIGHT or
    D3DSTATUS_CLIPUNIONTOP or
    D3DSTATUS_CLIPUNIONBOTTOM or
    D3DSTATUS_CLIPUNIONFRONT or
    D3DSTATUS_CLIPUNIONBACK or
    D3DSTATUS_CLIPUNIONGEN0 or
    D3DSTATUS_CLIPUNIONGEN1 or
    D3DSTATUS_CLIPUNIONGEN2 or
    D3DSTATUS_CLIPUNIONGEN3 or
    D3DSTATUS_CLIPUNIONGEN4 or
    D3DSTATUS_CLIPUNIONGEN5;

  D3DSTATUS_CLIPINTERSECTIONALL =
    D3DSTATUS_CLIPINTERSECTIONLEFT or
    D3DSTATUS_CLIPINTERSECTIONRIGHT or
    D3DSTATUS_CLIPINTERSECTIONTOP or
    D3DSTATUS_CLIPINTERSECTIONBOTTOM or
    D3DSTATUS_CLIPINTERSECTIONFRONT or
    D3DSTATUS_CLIPINTERSECTIONBACK or
    D3DSTATUS_CLIPINTERSECTIONGEN0 or
    D3DSTATUS_CLIPINTERSECTIONGEN1 or
    D3DSTATUS_CLIPINTERSECTIONGEN2 or
    D3DSTATUS_CLIPINTERSECTIONGEN3 or
    D3DSTATUS_CLIPINTERSECTIONGEN4 or
    D3DSTATUS_CLIPINTERSECTIONGEN5;

  D3DSTATUS_DEFAULT = (
    D3DSTATUS_CLIPINTERSECTIONALL or
    D3DSTATUS_ZNOTVISIBLE );

{ Options for direct transform calls }

  D3DTRANSFORM_CLIPPED       = $00000001;
  D3DTRANSFORM_UNCLIPPED     = $00000002;

type
{ TD3DTransformData structure }

  PD3DTransformData = ^TD3DTransformData;
  TD3DTransformData = record
    dwSize: DWORD;
    lpIn: Pointer;             // Input vertices
    dwInSize: DWORD;           // Stride of input vertices
    lpOut: Pointer;            // Output vertices
    dwOutSize: DWORD;          // Stride of output vertices
    lpHOut: PD3DHVertex;       // Output homogeneous vertices
    dwClip: DWORD;             // Clipping hint
    dwClipIntersection: DWORD;
    dwClipUnion: DWORD;        // Union of all clip flags
    drExtent: TD3DRect;         // Extent of transformed vertices
  end;

  D3DTRANSFORMDATA = TD3DTransformData;
  LPD3DTRANSFORMDATA = PD3DTransformData;

{ TD3DLightingElement structure }

  PD3DLightingElement = ^TD3DLightingElement;
  TD3DLightingElement = record
    dvPosition: TD3DVector;           // Lightable point in model space
    dvNormal: TD3DVector;             // Normalised unit vector
  end;

  D3DLIGHTINGELEMENT = TD3DLightingElement;
  LPD3DLIGHTINGELEMENT = PD3DLightingElement;

{ TD3DMaterial structure }

  PD3DMaterial = ^TD3DMaterial;
  TD3DMaterial = record
    dwSize: DWORD;
    case Integer of
    0: (
      diffuse: TD3DColorValue;        // Diffuse color RGBA
      ambient: TD3DColorValue;        // Ambient color RGB
      specular: TD3DColorValue;       // Specular 'shininess'
      emissive: TD3DColorValue;       // Emissive color RGB
      power: TD3DValue;               // Sharpness if specular highlight
      hTexture: TD3DTextureHandle;    // Handle to texture map
      dwRampSize: DWORD;
      );
    1: (
      dcvDiffuse: TD3DColorValue;
      dcvAmbient: TD3DColorValue;
      dcvSpecular: TD3DColorValue;
      dcvEmissive: TD3DColorValue;
      dvPower: TD3DValue;
      );
  end;

  D3DMATERIAL = TD3DMaterial;
  LPD3DMATERIAL = PD3DMaterial;

{ TD3DLightType }

  TD3DLightType = (
    D3DLIGHT_INVALID_0,
    D3DLIGHT_POINT,
    D3DLIGHT_SPOT,
    D3DLIGHT_DIRECTIONAL,
    D3DLIGHT_PARALLELPOINT
{$IFDEF OlderThanDirectX5},D3DLIGHT_GLSPOT{$ENDIF}
  );

  D3DLIGHTTYPE = TD3DLightType;

{ TD3DLight structure }

  PD3DLight = ^TD3DLight;
  TD3DLight = record
    dwSize: DWORD;
    dltType: TD3DLightType;     // Type of light source
    dcvColor: TD3DColorValue;   // Color of light
    dvPosition: TD3DVector;     // Position in world space
    dvDirection: TD3DVector;    // Direction in world space
    dvRange: TD3DValue;         // Cutoff range
    dvFalloff: TD3DValue;       // Falloff
    dvAttenuation0: TD3DValue;  // Constant attenuation
    dvAttenuation1: TD3DValue;  // Linear attenuation
    dvAttenuation2: TD3DValue;  // Quadratic attenuation
    dvTheta: TD3DValue;         // Inner angle of spotlight cone
    dvPhi: TD3DValue;           // Outer angle of spotlight cone
  end;

  D3DLIGHT = TD3DLight;
  LPD3DLIGHT = PD3DLight;

{ Structure defining a light source and its properties. }

const
{ flags bits }

  D3DLIGHT_ACTIVE                       = $00000001;
  D3DLIGHT_NO_SPECULAR                  = $00000002;

type
{ TD3DLight2 structure }

  PD3DLight2 = ^TD3DLight2;
  TD3DLight2 = record
    dwSize: DWORD;
    dltType: TD3DLightType;     // Type of light source
    dcvColor: TD3DColorValue;   // Color of light
    dvPosition: TD3DVector;     // Position in world space
    dvDirection: TD3DVector;    // Direction in world space
    dvRange: TD3DValue;         // Cutoff range
    dvFalloff: TD3DValue;       // Falloff
    dvAttenuation0: TD3DValue;  // Constant attenuation
    dvAttenuation1: TD3DValue;  // Linear attenuation
    dvAttenuation2: TD3DValue;  // Quadratic attenuation
    dvTheta: TD3DValue;         // Inner angle of spotlight cone
    dvPhi: TD3DValue;           // Outer angle of spotlight cone
    dwFlags: DWORD;
  end;

  D3DLIGHT2 = TD3DLight2;
  LPD3DLIGHT2 = PD3DLight2;

{ TD3DLightData structure }

  PD3DLightData = ^TD3DLightData;
  TD3DLightData = record
    dwSize: DWORD;
    lpIn: PD3DLightingElement;   // Input positions and normals
    dwInSize: DWORD;             // Stride of input elements
    lpOut: PD3DTLVertex;         // Output colors
    dwOutSize: DWORD;            // Stride of output colors
  end;

  D3DLIGHTDATA = TD3DLightData;
  LPD3DLIGHTDATA = PD3DLightData;

(*
 * Before DX5, these values were in an enum called
 * D3DCOLORMODEL. This was not correct, since they are
 * bit flags. A driver can surface either or both flags
 * in the dcmColorModel member of D3DDEVICEDESC.
 *)

type
  TD3DColorModel = DWORD;
  D3DCOLORMODEL = TD3DColorModel;

const
  D3DCOLOR_INVALID_0 = 0;
  D3DCOLOR_MONO = 1;
  D3DCOLOR_RGB = 2;

{ Options for clearing }

const
  D3DCLEAR_TARGET  = $00000001; // Clear target surface
  D3DCLEAR_ZBUFFER = $00000002; // Clear target z buffer
  D3DCLEAR_STENCIL = $00000004; // Clear stencil planes

{ Supported op codes for execute instructions. }

type
  TD3DOpcode = (
    D3DOP_INVALID_0,
    D3DOP_POINT,
    D3DOP_LINE,
    D3DOP_TRIANGLE,
    D3DOP_MATRIXLOAD,
    D3DOP_MATRIXMULTIPLY,
    D3DOP_STATETRANSFORM,
    D3DOP_STATELIGHT,
    D3DOP_STATERENDER,
    D3DOP_PROCESSVERTICES,
    D3DOP_TEXTURELOAD,
    D3DOP_EXIT,
    D3DOP_BRANCHFORWARD,
    D3DOP_SPAN,
    D3DOP_SETSTATUS
  );

  D3DOPCODE = TD3DOpcode;

{ TD3DInstruction structure }

  TD3DInstruction = record
    bOpcode: Byte;   // Instruction opcode
    bSize: Byte;     // Size of each instruction data unit
    wCount: WORD;    // Count of instruction data units to follow
  end;
  D3DINSTRUCTION = TD3DInstruction;

{ TD3DTextureLoad structure }

  TD3DTextureLoad = record
    hDestTexture: TD3DTextureHandle;
    hSrcTexture: TD3DTextureHandle;
  end;
  D3DTEXTURELOAD = TD3DTextureLoad;

{ TD3DPickRecord structure }

  TD3DPickRecord = record
    bOpcode: BYTE;
    bPad: BYTE;
    dwOffset: DWORD;
    dvZ: TD3DValue;
  end;
  D3DPICKRECORD = TD3DPickRecord;

{ TD3DShadeMode }

  TD3DShadeMode = (
    D3DSHADE_INVALID_0,
    D3DSHADE_FLAT,
    D3DSHADE_GOURAUD,
    D3DSHADE_PHONG
  );

  D3DSHADEMODE = TD3DShadeMode;

{ TD3DFillMode }

  TD3DFillMode = (
    D3DFILL_INVALID_0,
    D3DFILL_POINT,
    D3DFILL_WIREFRAME,
    D3DFILL_SOLID
  );

  D3DFILLMODE = TD3DFillMode;

{ TD3DLinePattern structure }

  TD3DLinePattern = record
    wRepeatFactor: WORD;
    wLinePattern: WORD;
  end;

  D3DLINEPATTERN = TD3DLinePattern;

{ TD3DTextureFilter }

  TD3DTextureFilter = (
    D3DFILTER_INVALID_0,
    D3DFILTER_NEAREST,
    D3DFILTER_LINEAR,
    D3DFILTER_MIPNEAREST,
    D3DFILTER_MIPLINEAR,
    D3DFILTER_LINEARMIPNEAREST,
    D3DFILTER_LINEARMIPLINEAR
  );

  D3DTEXTUREFILTER = TD3DTextureFilter;

{ TD3DBlend }

  TD3DBlend = (
    D3DBLEND_INVALID_0,
    D3DBLEND_ZERO,
    D3DBLEND_ONE,
    D3DBLEND_SRCCOLOR,
    D3DBLEND_INVSRCCOLOR,
    D3DBLEND_SRCALPHA,
    D3DBLEND_INVSRCALPHA,
    D3DBLEND_DESTALPHA,
    D3DBLEND_INVDESTALPHA,
    D3DBLEND_DESTCOLOR,
    D3DBLEND_INVDESTCOLOR,
    D3DBLEND_SRCALPHASAT,
    D3DBLEND_BOTHSRCALPHA,
    D3DBLEND_BOTHINVSRCALPHA
  );

  D3DBLEND = TD3DBlend;

{ TD3DTextureBlend }

  TD3DTextureBlend = (
    D3DTBLEND_INVALID_0,
    D3DTBLEND_DECAL,
    D3DTBLEND_MODULATE,
    D3DTBLEND_DECALALPHA,
    D3DTBLEND_MODULATEALPHA,
    D3DTBLEND_DECALMASK,
    D3DTBLEND_MODULATEMASK,
    D3DTBLEND_COPY,
    D3DTBLEND_ADD
  );

  D3DTEXTUREBLEND = TD3DTextureBlend;

{ TD3DTextureAddress }

  TD3DTextureAddress = (
    D3DTADDRESS_INVALID_0,
    D3DTADDRESS_WRAP,
    D3DTADDRESS_MIRROR,
    D3DTADDRESS_CLAMP,
    D3DTADDRESS_BORDER
  );

  D3DTEXTUREADDRESS = TD3DTextureAddress;

{ TD3DCull }

  TD3DCull = (
    D3DCULL_INVALID_0,
    D3DCULL_NONE,
    D3DCULL_CW,
    D3DCULL_CCW
  );

  D3DCULL = TD3DCull;

{ TD3DCmpFunc }

  TD3DCmpFunc = (
    D3DCMP_INVALID_0,
    D3DCMP_NEVER,
    D3DCMP_LESS,
    D3DCMP_EQUAL,
    D3DCMP_LESSEQUAL,
    D3DCMP_GREATER,
    D3DCMP_NOTEQUAL,
    D3DCMP_GREATEREQUAL,
    D3DCMP_ALWAYS
  );

  D3DCMPFUNC = TD3DCmpFunc;

{ TD3DStencilOp }

  TD3DStencilOp = (
    D3DSTENCILOP_INVALID_0,
    D3DSTENCILOP_KEEP,
    D3DSTENCILOP_ZERO,
    D3DSTENCILOP_REPLACE,
    D3DSTENCILOP_INCRSAT,
    D3DSTENCILOP_DECRSAT,
    D3DSTENCILOP_INVERT,
    D3DSTENCILOP_INCR,
    D3DSTENCILOP_DECR
  );

  D3DSTENCILOP = TD3DStencilOp;

{ TD3DFogMode }

  TD3DFogMode = (
    D3DFOG_NONE,
    D3DFOG_EXP,
    D3DFOG_EXP2,
    D3DFOG_LINEAR
  );

  D3DFOGMODE = TD3DFogMode;

{ TD3DZBufferType }

  TD3DZBufferType = (
    D3DZB_FALSE,
    D3DZB_TRUE,     // Z buffering
    D3DZB_USEW      // W buffering
  );

  D3DZBUFFERTYPE = TD3DZBufferType;

{ TD3DAntialiasMode }

  TD3DAntialiasMode = (
    D3DANTIALIAS_NONE,
    D3DANTIALIAS_SORTDEPENDENT,
    D3DANTIALIAS_SORTINDEPENDENT
  );

  D3DANTIALIASMODE = TD3DAntialiasMode;

{ TD3DVertexType }

  TD3DVertexType = (
    D3DVT_INVALID_0,
    D3DVT_VERTEX,
    D3DVT_LVERTEX,
    D3DVT_TLVERTEX
  );

  D3DVERTEXTYPE = TD3DVertexType;

{ TD3DPrimitiveType }

  TD3DPrimitiveType = (
    D3DPT_INVALID_0,
    D3DPT_POINTLIST,
    D3DPT_LINELIST,
    D3DPT_LINESTRIP,
    D3DPT_TRIANGLELIST,
    D3DPT_TRIANGLESTRIP,
    D3DPT_TRIANGLEFAN
  );

  D3DPRIMITIVETYPE = TD3DPrimitiveType;

{ Amount to add to a state to generate the override for that state. }

const
  D3DSTATE_OVERRIDE_BIAS = 256;

{ A state which sets the override flag for the specified state type. }

type
{ TD3DTransformStateType }

  TD3DTransformStateType = (
    D3DTRANSFORMSTATE_INVALID_0,
    D3DTRANSFORMSTATE_WORLD,
    D3DTRANSFORMSTATE_VIEW,
    D3DTRANSFORMSTATE_PROJECTION
  );

  D3DTRANSFORMSTATETYPE = TD3DTransformStateType;

{ TD3DLightStateType }

  TD3DLightStateType = (
    D3DLIGHTSTATE_INVALID_0,
    D3DLIGHTSTATE_MATERIAL,
    D3DLIGHTSTATE_AMBIENT,
    D3DLIGHTSTATE_COLORMODEL,
    D3DLIGHTSTATE_FOGMODE,
    D3DLIGHTSTATE_FOGSTART,
    D3DLIGHTSTATE_FOGEND,
    D3DLIGHTSTATE_FOGDENSITY,
    D3DLIGHTSTATE_COLORVERTEX
  );

  D3DLIGHTSTATETYPE = TD3DLightStateType;

{ TD3DRenderStateType }

  TD3DRenderStateType = (
    D3DRENDERSTATE_INVALID_0,
    D3DRENDERSTATE_TEXTUREHANDLE,       // Texture handle for legacy interfaces (Texture,Texture2)
    D3DRENDERSTATE_ANTIALIAS,           // TD3DAntialiasMode
    D3DRENDERSTATE_TEXTUREADDRESS,      // TD3DTextureAddress
    D3DRENDERSTATE_TEXTUREPERSPECTIVE,  // TRUE for perspective correction
    D3DRENDERSTATE_WRAPU,               // TRUE for wrapping in u
    D3DRENDERSTATE_WRAPV,               // TRUE for wrapping in v
    D3DRENDERSTATE_ZENABLE,             // TD3DZBufferType (or TRUE/FALSE for legacy)
    D3DRENDERSTATE_FILLMODE,            // TD3DFillMode
    D3DRENDERSTATE_SHADEMODE,           // TD3DShadeMode
    D3DRENDERSTATE_LINEPATTERN,         // TD3DLinePattern
    D3DRENDERSTATE_MONOENABLE,          // TRUE to enable mono rasterization
    D3DRENDERSTATE_ROP2,                // ROP2
    D3DRENDERSTATE_PLANEMASK,           // DWORD physical plane mask
    D3DRENDERSTATE_ZWRITEENABLE,        // TRUE to enable z writes
    D3DRENDERSTATE_ALPHATESTENABLE,     // TRUE to enable alpha tests
    D3DRENDERSTATE_LASTPIXEL,           // TRUE for last-pixel on lines
    D3DRENDERSTATE_TEXTUREMAG,          // TD3DTextureFilter
    D3DRENDERSTATE_TEXTUREMIN,          // TD3DTextureFilter
    D3DRENDERSTATE_SRCBLEND,            // TD3DBlend
    D3DRENDERSTATE_DESTBLEND,           // TD3DBlend
    D3DRENDERSTATE_TEXTUREMAPBLEND,     // TD3DTextureBlend
    D3DRENDERSTATE_CULLMODE,            // TD3DCull
    D3DRENDERSTATE_ZFUNC,               // TD3DCmpFunc
    D3DRENDERSTATE_ALPHAREF,            // TD3DFixed
    D3DRENDERSTATE_ALPHAFUNC,           // TD3DCmpFunc
    D3DRENDERSTATE_DITHERENABLE,        // TRUE to enable dithering
    D3DRENDERSTATE_ALPHABLENDENABLE,    // TRUE to enable alpha blending
    D3DRENDERSTATE_FOGENABLE,           // TRUE to enable fog
    D3DRENDERSTATE_SPECULARENABLE,      // TRUE to enable specular
    D3DRENDERSTATE_ZVISIBLE,            // TRUE to enable z checking
    D3DRENDERSTATE_SUBPIXEL,            // TRUE to enable subpixel correction
    D3DRENDERSTATE_SUBPIXELX,           // TRUE to enable correction in X only
    D3DRENDERSTATE_STIPPLEDALPHA,       // TRUE to enable stippled alpha
    D3DRENDERSTATE_FOGCOLOR,            // TD3DColor
    D3DRENDERSTATE_FOGTABLEMODE,        // TD3DFogMode
    D3DRENDERSTATE_FOGTABLESTART,       // Fog table start
    D3DRENDERSTATE_FOGTABLEEND,         // Fog table end
    D3DRENDERSTATE_FOGTABLEDENSITY,     // Fog table density
    D3DRENDERSTATE_STIPPLEENABLE,       // TRUE to enable stippling
    D3DRENDERSTATE_EDGEANTIALIAS,       // TRUE to enable edge antialiasing
    D3DRENDERSTATE_COLORKEYENABLE,      // TRUE to enable source colorkeyed textures
    D3DRENDERSTATE_BORDERCOLOR,         // Border color for texturing w/border
    D3DRENDERSTATE_TEXTUREADDRESSU,     // Texture addressing mode for U coordinate
    D3DRENDERSTATE_TEXTUREADDRESSV,     // Texture addressing mode for V coordinate
    D3DRENDERSTATE_MIPMAPLODBIAS,       // TD3DValue Mipmap LOD bias
    D3DRENDERSTATE_ZBIAS,               // LONG Z bias
    D3DRENDERSTATE_RANGEFOGENABLE,      // Enables range-based fog
    D3DRENDERSTATE_ANISOTROPY,          // Max. anisotropy. 1 = no anisotropy
    D3DRENDERSTATE_FLUSHBATCH,          // Explicit flush for DP batching (DX5 Only)
    D3DRENDERSTATE_TRANSLUCENTSORTINDEPENDENT,// BOOL enable sort-independent transparency
    D3DRENDERSTATE_STENCILENABLE,       // BOOL enable/disable stenciling
    D3DRENDERSTATE_STENCILFAIL,         // TD3DStencilOp to do if stencil test fails
    D3DRENDERSTATE_STENCILZFAIL,        // TD3DStencilOp to do if stencil test passes and Z test fails
    D3DRENDERSTATE_STENCILPASS,         // TD3DStencilOp to do if both stencil and Z tests pass
    D3DRENDERSTATE_STENCILFUNC ,        // TD3DCmpFunc fn.  Stencil Test passes if ((ref & mask) stencilfn (stencil & mask)) is true
    D3DRENDERSTATE_STENCILREF,          // Reference value used in stencil test
    D3DRENDERSTATE_STENCILMASK,         // Mask value used in stencil test
    D3DRENDERSTATE_STENCILWRITEMASK,    // Write mask applied to values written to stencil buffer
    D3DRENDERSTATE_TEXTUREFACTOR,       // TD3DColor used for multi-texture blend
    D3DRENDERSTATE_INVALID_61,
    D3DRENDERSTATE_INVALID_62,
    D3DRENDERSTATE_INVALID_63,
    D3DRENDERSTATE_STIPPLEPATTERN00,    // Stipple pattern 01...
    D3DRENDERSTATE_STIPPLEPATTERN01,
    D3DRENDERSTATE_STIPPLEPATTERN02,
    D3DRENDERSTATE_STIPPLEPATTERN03,
    D3DRENDERSTATE_STIPPLEPATTERN04,
    D3DRENDERSTATE_STIPPLEPATTERN05,
    D3DRENDERSTATE_STIPPLEPATTERN06,
    D3DRENDERSTATE_STIPPLEPATTERN07,
    D3DRENDERSTATE_STIPPLEPATTERN08,
    D3DRENDERSTATE_STIPPLEPATTERN09,
    D3DRENDERSTATE_STIPPLEPATTERN10,
    D3DRENDERSTATE_STIPPLEPATTERN11,
    D3DRENDERSTATE_STIPPLEPATTERN12,
    D3DRENDERSTATE_STIPPLEPATTERN13,
    D3DRENDERSTATE_STIPPLEPATTERN14,
    D3DRENDERSTATE_STIPPLEPATTERN15,
    D3DRENDERSTATE_STIPPLEPATTERN16,
    D3DRENDERSTATE_STIPPLEPATTERN17,
    D3DRENDERSTATE_STIPPLEPATTERN18,
    D3DRENDERSTATE_STIPPLEPATTERN19,
    D3DRENDERSTATE_STIPPLEPATTERN20,
    D3DRENDERSTATE_STIPPLEPATTERN21,
    D3DRENDERSTATE_STIPPLEPATTERN22,
    D3DRENDERSTATE_STIPPLEPATTERN23,
    D3DRENDERSTATE_STIPPLEPATTERN24,
    D3DRENDERSTATE_STIPPLEPATTERN25,
    D3DRENDERSTATE_STIPPLEPATTERN26,
    D3DRENDERSTATE_STIPPLEPATTERN27,
    D3DRENDERSTATE_STIPPLEPATTERN28,
    D3DRENDERSTATE_STIPPLEPATTERN29,
    D3DRENDERSTATE_STIPPLEPATTERN30,
    D3DRENDERSTATE_STIPPLEPATTERN31,
    D3DRENDERSTATE_INVALID_95,
    D3DRENDERSTATE_INVALID_96,
    D3DRENDERSTATE_INVALID_97,
    D3DRENDERSTATE_INVALID_98,
    D3DRENDERSTATE_INVALID_99,
    D3DRENDERSTATE_INVALID_100,
    D3DRENDERSTATE_INVALID_101,
    D3DRENDERSTATE_INVALID_102,
    D3DRENDERSTATE_INVALID_103,
    D3DRENDERSTATE_INVALID_104,
    D3DRENDERSTATE_INVALID_105,
    D3DRENDERSTATE_INVALID_106,
    D3DRENDERSTATE_INVALID_107,
    D3DRENDERSTATE_INVALID_108,
    D3DRENDERSTATE_INVALID_109,
    D3DRENDERSTATE_INVALID_110,
    D3DRENDERSTATE_INVALID_111,
    D3DRENDERSTATE_INVALID_112,
    D3DRENDERSTATE_INVALID_113,
    D3DRENDERSTATE_INVALID_114,
    D3DRENDERSTATE_INVALID_115,
    D3DRENDERSTATE_INVALID_116,
    D3DRENDERSTATE_INVALID_117,
    D3DRENDERSTATE_INVALID_118,
    D3DRENDERSTATE_INVALID_119,
    D3DRENDERSTATE_INVALID_120,
    D3DRENDERSTATE_INVALID_121,
    D3DRENDERSTATE_INVALID_122,
    D3DRENDERSTATE_INVALID_123,
    D3DRENDERSTATE_INVALID_124,
    D3DRENDERSTATE_INVALID_125,
    D3DRENDERSTATE_INVALID_126,
    D3DRENDERSTATE_INVALID_127,
    //
    // 128 values [128, 255] are reserved for texture coordinate wrap flags.
    // These are constructed with the D3DWRAP_U and D3DWRAP_V macros. Using
    // a flags word preserves forward compatibility with texture coordinates
    // that are >2D.
    //
    D3DRENDERSTATE_WRAP0,               // wrap for 1st texture coord. set
    D3DRENDERSTATE_WRAP1,               // wrap for 2nd texture coord. set
    D3DRENDERSTATE_WRAP2,               // wrap for 3rd texture coord. set
    D3DRENDERSTATE_WRAP3,               // wrap for 4th texture coord. set
    D3DRENDERSTATE_WRAP4,               // wrap for 5th texture coord. set
    D3DRENDERSTATE_WRAP5,               // wrap for 6th texture coord. set
    D3DRENDERSTATE_WRAP6,               // wrap for 7th texture coord. set
    D3DRENDERSTATE_WRAP7                // wrap for 8th texture coord. set
  );

  D3DRENDERSTATETYPE = TD3DRenderStateType;

const
{ For back-compatibility with legacy compilations }
  D3DRENDERSTATE_BLENDENABLE = D3DRENDERSTATE_ALPHABLENDENABLE;

{ Bias to apply to the texture coordinate set to apply a wrap to. }
  D3DRENDERSTATE_WRAPBIAS = TD3DRenderStateType(128);

{ Flags to construct the WRAP render states }
  D3DWRAP_U = $00000001;
  D3DWRAP_V = $00000002;

type

  TD3DState = record
    case Integer of
    0: (
      dtstTransformStateType: TD3DTransformStateType;
      dwArg: array[0..0] of DWORD;
      );
    1: (
      dlstLightStateType: TD3DLightStateType;
      dvArg: array[0..0] of TD3DValue;
      );
    2: (
      drstRenderStateType: TD3DRenderStateType;
      );
  end;

  D3DSTATE = TD3DState;

{ TD3DMatrixLoad structure }

  TD3DMatrixLoad = record
    hDestMatrix: TD3DMatrixHandle;   // Destination matrix
    hSrcMatrix: TD3DMatrixHandle;    // Source matrix
  end;

  D3DMATRIXLOAD = TD3DMatrixLoad;

{ TD3DMatrixMultiply structure }

  TD3DMatrixMultiply = record
    hDestMatrix: TD3DMatrixHandle;   // Destination matrix
    hSrcMatrix1: TD3DMatrixHandle;   // First source matrix
    hSrcMatrix2: TD3DMatrixHandle;   // Second source matrix
  end;

  D3DMATRIXMULTIPLY = TD3DMatrixMultiply;

{ TD3DProcessVertices structure }

  TD3DProcessVertices = record
    dwFlags: DWORD;           // Do we transform or light or just copy?
    wStart: WORD;             // Index to first vertex in source
    wDest: WORD;              // Index to first vertex in local buffer
    dwCount: DWORD;           // Number of vertices to be processed
    dwReserved: DWORD;        // Must be zero
  end;

  D3DPROCESSVERTICES = TD3DProcessVertices;

const
  D3DPROCESSVERTICES_TRANSFORMLIGHT       = $00000000;
  D3DPROCESSVERTICES_TRANSFORM            = $00000001;
  D3DPROCESSVERTICES_COPY                 = $00000002;
  D3DPROCESSVERTICES_OPMASK               = $00000007;

  D3DPROCESSVERTICES_UPDATEEXTENTS        = $00000008;
  D3DPROCESSVERTICES_NOCOLOR              = $00000010;

{ TD3DTextureStagesStateType }

type
  TD3DTextureStagesStateType = (
    D3DTSS_INVALID_0,
    D3DTSS_COLOROP,           // TD3DTextureOp - per-stage blending controls for color channels
    D3DTSS_COLORARG1,         // D3DTA_* (texture arg)
    D3DTSS_COLORARG2,         // D3DTA_* (texture arg)
    D3DTSS_ALPHAOP,           // TD3DTextureOp - per-stage blending controls for alpha channel
    D3DTSS_ALPHAARG1,         // D3DTA_* (texture arg)
    D3DTSS_ALPHAARG2,         // D3DTA_* (texture arg)
    D3DTSS_BUMPENVMAT00,      // TD3DValue (bump mapping matrix)
    D3DTSS_BUMPENVMAT01,      // TD3DValue (bump mapping matrix)
    D3DTSS_BUMPENVMAT10,      // TD3DValue (bump mapping matrix)
    D3DTSS_BUMPENVMAT11,      // TD3DValue (bump mapping matrix)
    D3DTSS_TEXCOORDINDEX,     // identifies which set of texture coordinates index this texture
    D3DTSS_ADDRESS,           // TD3DTextureAddress for both coordinates
    D3DTSS_ADDRESSU,          // TD3DTextureAddress for U coordinate
    D3DTSS_ADDRESSV,          // TD3DTextureAddress for V coordinate
    D3DTSS_BORDERCOLOR,       // TD3DColor
    D3DTSS_MAGFILTER,         // TD3DTextureMagFilter filter to use for magnification
    D3DTSS_MINFILTER,         // TD3DTextureMinFilter filter to use for minification
    D3DTSS_MIPFILTER,         // TD3DTextureMipFilter filter to use between mipmaps during minification
    D3DTSS_MIPMAPLODBIAS,     // D3DVALUE Mipmap LOD bias
    D3DTSS_MAXMIPLEVEL,       // DWORD 0..(n-1) LOD index of largest map to use (0 == largest)
    D3DTSS_MAXANISOTROPY,     // DWORD maximum anisotropy
    D3DTSS_BUMPENVLSCALE,     // TD3DValue scale for bump map luminance
    D3DTSS_BUMPENVLOFFSET     // TD3DValue offset for bump map luminance
  );

  D3DTEXTURESTAGESTATETYPE = TD3DTextureStagesStateType;

{ TD3DTextureOp }

  TD3DTextureOp = (
    D3DTOP_INVALID_0,
    // Control
    D3DTOP_DISABLE,                    // disables stage
    D3DTOP_SELECTARG1,                 // the default
    D3DTOP_SELECTARG2,
    // Modulate
    D3DTOP_MODULATE,                   // multiply args together
    D3DTOP_MODULATE2X,                 // multiply and  1 bit
    D3DTOP_MODULATE4X,                 // multiply and  2 bits
    // Add
    D3DTOP_ADD,                        // add arguments together
    D3DTOP_ADDSIGNED,                  // add with -0.5 bias
    D3DTOP_ADDSIGNED2X,                // as above but left  1 bit
    D3DTOP_SUBTRACT,                   // Arg1 - Arg2, with no saturation
    D3DTOP_ADDSMOOTH,                  // add 2 args, subtract product
                                       // Arg1 + Arg2 - Arg1*Arg2
                                       // = Arg1 + (1-Arg1)*Arg2
    // Linear alpha blend: Arg1*(Alpha) + Arg2*(1-Alpha)
    D3DTOP_BLENDDIFFUSEALPHA,          // iterated alpha
    D3DTOP_BLENDTEXTUREALPHA,          // texture alpha
    D3DTOP_BLENDFACTORALPHA,           // alpha from D3DRENDERSTATE_TEXTUREFACTOR
    // Linear alpha blend with pre-multiplied arg1 input: Arg1 + Arg2*(1-Alpha)
    D3DTOP_BLENDTEXTUREALPHAPM,        // texture alpha
    D3DTOP_BLENDCURRENTALPHA,          // by alpha of current color
    // Specular mapping
    D3DTOP_PREMODULATE,                // modulate with next texture before use
    D3DTOP_MODULATEALPHA_ADDCOLOR,     // Arg1.RGB + Arg1.A*Arg2.RGB
                                       // COLOROP only
    D3DTOP_MODULATECOLOR_ADDALPHA,     // Arg1.RGB*Arg2.RGB + Arg1.A
                                       // COLOROP only
    D3DTOP_MODULATEINVALPHA_ADDCOLOR,  // (1-Arg1.A)*Arg2.RGB + Arg1.RGB
                                       // COLOROP only
    D3DTOP_MODULATEINVCOLOR_ADDALPHA,  // (1-Arg1.RGB)*Arg2.RGB + Arg1.A
                                       // COLOROP only
    // Bump mapping
    D3DTOP_BUMPENVMAP,                 // per pixel env map perturbation
    D3DTOP_BUMPENVMAPLUMINANCE,        // with luminance channel
    // This can do either diffuse or specular bump mapping with correct input.
    // Performs the function (Arg1.R*Arg2.R + Arg1.G*Arg2.G + Arg1.B*Arg2.B)
    // where each component has been scaled and offset to make it signed.
    // The result is replicated into all four (including alpha) channels.
    // This is a valid COLOROP only.
    D3DTOP_DOTPRODUCT3
  );

  D3DTEXTUREOP = TD3DTextureOp;

{ Values for COLORARG1,2 and ALPHAARG1,2 texture blending operations
  set in texture processing stage controls in D3DRENDERSTATE. }

const
  D3DTA_SELECTMASK     = $0000000f;  // mask for arg selector
  D3DTA_DIFFUSE        = $00000000;  // select diffuse color
  D3DTA_CURRENT        = $00000001;  // select result of previous stage
  D3DTA_TEXTURE        = $00000002;  // select texture color
  D3DTA_TFACTOR        = $00000003;  // select RENDERSTATE_TEXTUREFACTOR
  D3DTA_COMPLEMENT     = $00000010;  // take 1.0 - x
  D3DTA_ALPHAREPLICATE = $00000020;  // replicate alpha to color components

{ IDirect3DTexture2 State Filter Types }

type
  TD3DTextureMagFilter = (
    D3DTFG_INVALID_0,
    D3DTFG_POINT,          // nearest
    D3DTFG_LINEAR,         // linear interpolation
    D3DTFG_FLATCUBIC,      // cubic
    D3DTFG_GAUSSIANCUBIC,  // different cubic kernel
    D3DTFG_ANISOTROPIC
  );

  D3DTEXTUREMAGFILTER = TD3DTextureMagFilter;

  TD3DTextureMinFilter = (
    D3DTFN_INVALID_0,
    D3DTFN_POINT,          // nearest
    D3DTFN_LINEAR,         // linear interpolation
    D3DTFN_ANISOTROPIC
  );

  D3DTEXTUREMINFILTER = TD3DTextureMinFilter;

  TD3DTextureMipFilter = (
    D3DTFP_INVALID_0,
    D3DTFP_NONE,           // mipmapping disabled (use MAG filter)
    D3DTFP_POINT,          // nearest
    D3DTFP_LINEAR          // linear interpolation
  );

  D3DTEXTUREMIPFILTER = TD3DTextureMipFilter;

{ Triangle flags }

const
  D3DTRIFLAG_START                        = $00000000;
  D3DTRIFLAG_ODD                          = $0000001e;
  D3DTRIFLAG_EVEN                         = $0000001f;

function D3DTRIFLAG_STARTFLAT(len: DWORD): DWORD;

{ Triangle edge flags }

const
  D3DTRIFLAG_EDGEENABLE1                  = $00000100; // v0-v1 edge
  D3DTRIFLAG_EDGEENABLE2                  = $00000200; // v1-v2 edge
  D3DTRIFLAG_EDGEENABLE3                  = $00000400; // v2-v0 edge
  D3DTRIFLAG_EDGEENABLETRIANGLE =
      D3DTRIFLAG_EDGEENABLE1 or D3DTRIFLAG_EDGEENABLE2 or D3DTRIFLAG_EDGEENABLE3;

{ TD3DTriangle structure }

type
  PD3DTriangle = ^TD3DTriangle;
  TD3DTriangle = record
    case Integer of
    0: (
      v1: WORD;            // Vertex indices
      v2: WORD;
      v3: WORD;
      wFlags: WORD;        // Edge (and other) flags
      );
    1: (
      wV1: WORD;
      wV2: WORD;
      wV3: WORD;
      );
  end;

  D3DTRIANGLE = TD3DTriangle;
  LPD3DTRIANGLE = PD3DTriangle;

{ TD3DLine structure }

  PD3DLine = ^TD3DLine;
  TD3DLine = record
    case Integer of
    0: (
      v1: WORD;            // Vertex indices
      v2: WORD;
      );
    1: (
      wV1: WORD;
      wV2: WORD;
      );
  end;

  D3DLINE = TD3DLine;
  LPD3DLINE = PD3DLine;

{ TD3DSpan structure }

  PD3DSpan = ^TD3DSpan;
  TD3DSpan = record
    wCount: WORD;        // Number of spans
    wFirst: WORD;        // Index to first vertex
  end;

  D3DSPAN = TD3DSpan;
  LPD3DSPAN = PD3DSpan;

{ TD3DPoint structure }

  PD3DPoint = ^TD3DPoint;
  TD3DPoint = record
    wCount: WORD;        // number of points
    wFirst: WORD;        // index to first vertex
  end;

  D3DPOINT = TD3DPoint;
  LPD3DPOINT = PD3DPoint;

{ TD3DBranch structure }

  PD3DBranch = ^TD3DBranch;
  TD3DBranch = record
    dwMask: DWORD;         // Bitmask against D3D status
    dwValue: DWORD;
    bNegate: BOOL;         // TRUE to negate comparison
    dwOffset: DWORD;       // How far to branch forward (0 for exit)
  end;

  D3DBRANCH = TD3DBranch;
  LPD3DBRANCH = PD3DBranch;

{ TD3DStatus structure }

  PD3DStatus = ^TD3DStatus;
  TD3DStatus = record
    dwFlags: DWORD;        // Do we set extents or status
    dwStatus: DWORD;       // D3D status
    drExtent: TD3DRect;
  end;

  D3DSTATUS = TD3DStatus;
  LPD3DSTATUS = PD3DStatus;

const
  D3DSETSTATUS_STATUS   = $00000001;
  D3DSETSTATUS_EXTENTS  = $00000002;
  D3DSETSTATUS_ALL      = D3DSETSTATUS_STATUS or D3DSETSTATUS_EXTENTS;

{ TD3DClipStatus structure }

type
  PD3DClipStatus = ^TD3DClipStatus;
  TD3DClipStatus = record
    dwFlags: DWORD;     // Do we set 2d extents, 3D extents or status
    dwStatus: DWORD;    // Clip status
    minx, maxx: Single; // X extents
    miny, maxy: Single; // Y extents
    minz, maxz: Single; // Z extents
  end;

  D3DCLIPSTATUS = TD3DClipStatus;
  LPD3DCLIPSTATUS = PD3DClipStatus;

const
  D3DCLIPSTATUS_STATUS        = $00000001;
  D3DCLIPSTATUS_EXTENTS2      = $00000002;
  D3DCLIPSTATUS_EXTENTS3      = $00000004;

{ TD3DStats structure }

type
  PD3DStats = ^TD3DStats;
  TD3DStats = record
    dwSize: DWORD;
    dwTrianglesDrawn: DWORD;
    dwLinesDrawn: DWORD;
    dwPointsDrawn: DWORD;
    dwSpansDrawn: DWORD;
    dwVerticesProcessed: DWORD;
  end;

  D3DSTATS = TD3DStats;
  LPD3DSTATS = PD3DStats;

{ Execute options. }

const
  D3DEXECUTE_CLIPPED       = $00000001;
  D3DEXECUTE_UNCLIPPED     = $00000002;

{ TD3DExecuteData structure }

type
  PD3DExecuteData = ^TD3DExecuteData;
  TD3DExecuteData = record
    dwSize: DWORD;
    dwVertexOffset: DWORD;
    dwVertexCount: DWORD;
    dwInstructionOffset: DWORD;
    dwInstructionLength: DWORD;
    dwHVertexOffset: DWORD;
    dsStatus: D3DSTATUS;       // Status after execute
  end;

  D3DEXECUTEDATA = TD3DExecuteData;
  LPD3DEXECUTEDATA = PD3DExecuteData;

{ Palette flags. }

const
  D3DPAL_FREE     = $00;    // Renderer may use this entry freely
  D3DPAL_READONLY = $40;    // Renderer may not set this entry
  D3DPAL_RESERVED = $80;    // Renderer may not use this entry

{ TD3DVertexBufferDesc structure }

type
  PD3DVertexBufferDesc = ^TD3DVertexBufferDesc;
  TD3DVertexBufferDesc = record
    dwSize: DWORD;
    dwCaps: DWORD;
    dwFVF: DWORD;
    dwNumVertices: DWORD;
  end;

  D3DVERTEXBUFFERDESC = TD3DVertexBufferDesc;
  LPD3DVERTEXBUFFERDESC = PD3DVertexBufferDesc;

{ These correspond to DDSCAPS_* flags }

const
  D3DVBCAPS_SYSTEMMEMORY = $00000800;
  D3DVBCAPS_WRITEONLY    = $00010000;
  D3DVBCAPS_OPTIMIZED    = $80000000;

{ Vertex Operations for ProcessVertices }

  D3DVOP_LIGHT     = 1 shl 10;
  D3DVOP_TRANSFORM = 1 shl 0;
  D3DVOP_CLIP      = 1 shl 2;
  D3DVOP_EXTENTS   = 1 shl 3;

{ Flexible vertex format bits }

  D3DFVF_RESERVED0      = $001;
  D3DFVF_POSITION_MASK  = $00E;
  D3DFVF_XYZ            = $002;
  D3DFVF_XYZRHW         = $004;
  D3DFVF_NORMAL         = $010;
  D3DFVF_RESERVED1      = $020;
  D3DFVF_DIFFUSE        = $040;
  D3DFVF_SPECULAR       = $080;
  D3DFVF_TEXCOUNT_MASK  = $f00;
  D3DFVF_TEXCOUNT_SHIFT = 8;
  D3DFVF_TEX0           = $000;
  D3DFVF_TEX1           = $100;
  D3DFVF_TEX2           = $200;
  D3DFVF_TEX3           = $300;
  D3DFVF_TEX4           = $400;
  D3DFVF_TEX5           = $500;
  D3DFVF_TEX6           = $600;
  D3DFVF_TEX7           = $700;
  D3DFVF_TEX8           = $800;
  D3DFVF_RESERVED2      = $F000; // 4 reserved bits
  D3DFVF_VERTEX         = D3DFVF_XYZ or D3DFVF_NORMAL or D3DFVF_TEX1;
  D3DFVF_LVERTEX        = D3DFVF_XYZ or D3DFVF_RESERVED1 or D3DFVF_DIFFUSE or
                            D3DFVF_SPECULAR or D3DFVF_TEX1;
  D3DFVF_TLVERTEX       = D3DFVF_XYZRHW or D3DFVF_DIFFUSE or D3DFVF_SPECULAR or
                            D3DFVF_TEX1;

{ TD3DDP_PtrStride }

type
  TD3DDP_PtrStride = record
    lpvData: Pointer;
    dwStride: DWORD;
  end;

  D3DDP_PTRSTRIDE = TD3DDP_PtrStride;

const
  D3DDP_MAXTEXCOORD = 8;

type
  PD3DDrawPrimitiveStridedData = ^TD3DDrawPrimitiveStridedData;
  TD3DDrawPrimitiveStridedData = record
    position: TD3DDP_PtrStride;
    normal: TD3DDP_PtrStride;
    diffuse: TD3DDP_PtrStride;
    specular: TD3DDP_PtrStride;
    textureCoords: array[0..D3DDP_MAXTEXCOORD-1] of TD3DDP_PtrStride;
  end;

  D3DDRAWPRIMITIVESTRIDEDDATA = TD3DDrawPrimitiveStridedData;
  LPD3DDRAWPRIMITIVESTRIDEDDATA = PD3DDrawPrimitiveStridedData;

{ ComputeSphereVisibility return values }

const
  D3DVIS_INSIDE_FRUSTUM    = 0;
  D3DVIS_INTERSECT_FRUSTUM = 1;
  D3DVIS_OUTSIDE_FRUSTUM   = 2;
  D3DVIS_INSIDE_LEFT       = 0;
  D3DVIS_INTERSECT_LEFT    = 1 shl 2;
  D3DVIS_OUTSIDE_LEFT      = 2 shl 2;
  D3DVIS_INSIDE_RIGHT      = 0;
  D3DVIS_INTERSECT_RIGHT   = 1 shl 4;
  D3DVIS_OUTSIDE_RIGHT     = 2 shl 4;
  D3DVIS_INSIDE_TOP        = 0;
  D3DVIS_INTERSECT_TOP     = 1 shl 6;
  D3DVIS_OUTSIDE_TOP       = 2 shl 6;
  D3DVIS_INSIDE_BOTTOM     = 0;
  D3DVIS_INTERSECT_BOTTOM  = 1 shl 8;
  D3DVIS_OUTSIDE_BOTTOM    = 2 shl 8;
  D3DVIS_INSIDE_NEAR       = 0;
  D3DVIS_INTERSECT_NEAR    = 1 shl 10;
  D3DVIS_OUTSIDE_NEAR      = 2 shl 10;
  D3DVIS_INSIDE_FAR        = 0;
  D3DVIS_INTERSECT_FAR     = 1 shl 12;
  D3DVIS_OUTSIDE_FAR       = 2 shl 12;

  D3DVIS_MASK_FRUSTUM      = 3 shl 0;
  D3DVIS_MASK_LEFT         = 3 shl 2;
  D3DVIS_MASK_RIGHT        = 3 shl 4;
  D3DVIS_MASK_TOP          = 3 shl 6;
  D3DVIS_MASK_BOTTOM       = 3 shl 8;
  D3DVIS_MASK_NEAR         = 3 shl 10;
  D3DVIS_MASK_FAR          = 3 shl 12;

(*==========================================================================;
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       d3dcaps.h
 *  Content:    Direct3D capabilities include file
 *
 ***************************************************************************)

{ Description of capabilities of transform }

type
  PD3DTransformCaps = ^TD3DTransformCaps;
  TD3DTransformCaps = record
    dwSize: DWORD;
    dwCaps: DWORD;
  end;

  D3DTRANSFORMCAPS = TD3DTransformCaps;
  LPD3DTRANSFORMCAPS = PD3DTransformCaps;

const
  D3DTRANSFORMCAPS_CLIP = $00000001; // Will clip whilst transforming

{ Description of capabilities of lighting }

type
  PD3DLightingCaps = ^TD3DLightingCaps;
  TD3DLightingCaps = record
    dwSize: DWORD;
    dwCaps: DWORD;            // Lighting caps
    dwLightingModel: DWORD;   // Lighting model - RGB or mono
    dwNumLights: DWORD;       // Number of lights that can be handled
  end;

  D3DLIGHTINGCAPS = TD3DLightingCaps;
  LPD3DLIGHTINGCAPS = PD3DLightingCaps;

const
  D3DLIGHTINGMODEL_RGB        = $00000001;
  D3DLIGHTINGMODEL_MONO       = $00000002;

  D3DLIGHTCAPS_POINT          = $00000001; // Point lights supported
  D3DLIGHTCAPS_SPOT           = $00000002; // Spot lights supported
  D3DLIGHTCAPS_DIRECTIONAL    = $00000004; // Directional lights supported
  D3DLIGHTCAPS_PARALLELPOINT  = $00000008; // Parallel point lights supported
{$IFNDEF DirectX3}
  D3DLIGHTCAPS_GLSPOT         = $00000010; // GL syle spot lights supported
{$ENDIF}

{ Description of capabilities for each primitive type }

type
  PD3DPrimCaps = ^TD3DPrimCaps;
  TD3DPrimCaps = record
    dwSize: DWORD;
    dwMiscCaps: DWORD;                 // Capability flags
    dwRasterCaps: DWORD;
    dwZCmpCaps: DWORD;
    dwSrcBlendCaps: DWORD;
    dwDestBlendCaps: DWORD;
    dwAlphaCmpCaps: DWORD;
    dwShadeCaps: DWORD;
    dwTextureCaps: DWORD;
    dwTextureFilterCaps: DWORD;
    dwTextureBlendCaps: DWORD;
    dwTextureAddressCaps: DWORD;
    dwStippleWidth: DWORD;             // maximum width and height of
    dwStippleHeight: DWORD;            // of supported stipple (up to 32x32)
  end;

  D3DPRIMCAPS = TD3DPrimCaps;
  LPD3DPRIMCAPS = PD3DPrimCaps;

{ TD3DPrimCaps dwMiscCaps }

const
  D3DPMISCCAPS_MASKPLANES         = $00000001;
  D3DPMISCCAPS_MASKZ              = $00000002;
  D3DPMISCCAPS_LINEPATTERNREP     = $00000004;
  D3DPMISCCAPS_CONFORMANT         = $00000008;
  D3DPMISCCAPS_CULLNONE           = $00000010;
  D3DPMISCCAPS_CULLCW             = $00000020;
  D3DPMISCCAPS_CULLCCW            = $00000040;

{ TD3DPrimCaps dwRasterCaps }

  D3DPRASTERCAPS_DITHER                     = $00000001;
  D3DPRASTERCAPS_ROP2                       = $00000002;
  D3DPRASTERCAPS_XOR                        = $00000004;
  D3DPRASTERCAPS_PAT                        = $00000008;
  D3DPRASTERCAPS_ZTEST                      = $00000010;
  D3DPRASTERCAPS_SUBPIXEL                   = $00000020;
  D3DPRASTERCAPS_SUBPIXELX                  = $00000040;
  D3DPRASTERCAPS_FOGVERTEX                  = $00000080;
  D3DPRASTERCAPS_FOGTABLE                   = $00000100;
  D3DPRASTERCAPS_STIPPLE                    = $00000200;
  D3DPRASTERCAPS_ANTIALIASSORTDEPENDENT     = $00000400;
  D3DPRASTERCAPS_ANTIALIASSORTINDEPENDENT   = $00000800;
  D3DPRASTERCAPS_ANTIALIASEDGES             = $00001000;
  D3DPRASTERCAPS_MIPMAPLODBIAS              = $00002000;
  D3DPRASTERCAPS_ZBIAS                      = $00004000;
  D3DPRASTERCAPS_ZBUFFERLESSHSR             = $00008000;
  D3DPRASTERCAPS_FOGRANGE                   = $00010000;
  D3DPRASTERCAPS_ANISOTROPY                 = $00020000;
  D3DPRASTERCAPS_WBUFFER                    = $00040000;
  D3DPRASTERCAPS_TRANSLUCENTSORTINDEPENDENT = $00080000;
  D3DPRASTERCAPS_WFOG                       = $00100000;

{ TD3DPrimCaps dwZCmpCaps, dwAlphaCmpCaps }

  D3DPCMPCAPS_NEVER               = $00000001;
  D3DPCMPCAPS_LESS                = $00000002;
  D3DPCMPCAPS_EQUAL               = $00000004;
  D3DPCMPCAPS_LESSEQUAL           = $00000008;
  D3DPCMPCAPS_GREATER             = $00000010;
  D3DPCMPCAPS_NOTEQUAL            = $00000020;
  D3DPCMPCAPS_GREATEREQUAL        = $00000040;
  D3DPCMPCAPS_ALWAYS              = $00000080;

{ TD3DPrimCaps dwSourceBlendCaps, dwDestBlendCaps }

  D3DPBLENDCAPS_ZERO              = $00000001;
  D3DPBLENDCAPS_ONE               = $00000002;
  D3DPBLENDCAPS_SRCCOLOR          = $00000004;
  D3DPBLENDCAPS_INVSRCCOLOR       = $00000008;
  D3DPBLENDCAPS_SRCALPHA          = $00000010;
  D3DPBLENDCAPS_INVSRCALPHA       = $00000020;
  D3DPBLENDCAPS_DESTALPHA         = $00000040;
  D3DPBLENDCAPS_INVDESTALPHA      = $00000080;
  D3DPBLENDCAPS_DESTCOLOR         = $00000100;
  D3DPBLENDCAPS_INVDESTCOLOR      = $00000200;
  D3DPBLENDCAPS_SRCALPHASAT       = $00000400;
  D3DPBLENDCAPS_BOTHSRCALPHA      = $00000800;
  D3DPBLENDCAPS_BOTHINVSRCALPHA   = $00001000;

{ TD3DPrimCaps dwShadeCaps }

  D3DPSHADECAPS_COLORFLATMONO             = $00000001;
  D3DPSHADECAPS_COLORFLATRGB              = $00000002;
  D3DPSHADECAPS_COLORGOURAUDMONO          = $00000004;
  D3DPSHADECAPS_COLORGOURAUDRGB           = $00000008;
  D3DPSHADECAPS_COLORPHONGMONO            = $00000010;
  D3DPSHADECAPS_COLORPHONGRGB             = $00000020;

  D3DPSHADECAPS_SPECULARFLATMONO          = $00000040;
  D3DPSHADECAPS_SPECULARFLATRGB           = $00000080;
  D3DPSHADECAPS_SPECULARGOURAUDMONO       = $00000100;
  D3DPSHADECAPS_SPECULARGOURAUDRGB        = $00000200;
  D3DPSHADECAPS_SPECULARPHONGMONO         = $00000400;
  D3DPSHADECAPS_SPECULARPHONGRGB          = $00000800;

  D3DPSHADECAPS_ALPHAFLATBLEND            = $00001000;
  D3DPSHADECAPS_ALPHAFLATSTIPPLED         = $00002000;
  D3DPSHADECAPS_ALPHAGOURAUDBLEND         = $00004000;
  D3DPSHADECAPS_ALPHAGOURAUDSTIPPLED      = $00008000;
  D3DPSHADECAPS_ALPHAPHONGBLEND           = $00010000;
  D3DPSHADECAPS_ALPHAPHONGSTIPPLED        = $00020000;

  D3DPSHADECAPS_FOGFLAT                   = $00040000;
  D3DPSHADECAPS_FOGGOURAUD                = $00080000;
  D3DPSHADECAPS_FOGPHONG                  = $00100000;

{ TD3DPrimCaps dwTextureCaps }

  D3DPTEXTURECAPS_PERSPECTIVE              = $00000001;
  D3DPTEXTURECAPS_POW2                     = $00000002;
  D3DPTEXTURECAPS_ALPHA                    = $00000004;
  D3DPTEXTURECAPS_TRANSPARENCY             = $00000008;
  D3DPTEXTURECAPS_BORDER                   = $00000010;
  D3DPTEXTURECAPS_SQUAREONLY               = $00000020;
  D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE = $00000040;
  D3DPTEXTURECAPS_ALPHAPALETTE             = $00000080;

{ TD3DPrimCaps dwTextureFilterCaps }

  D3DPTFILTERCAPS_NEAREST          = $00000001;
  D3DPTFILTERCAPS_LINEAR           = $00000002;
  D3DPTFILTERCAPS_MIPNEAREST       = $00000004;
  D3DPTFILTERCAPS_MIPLINEAR        = $00000008;
  D3DPTFILTERCAPS_LINEARMIPNEAREST = $00000010;
  D3DPTFILTERCAPS_LINEARMIPLINEAR  = $00000020;

{ Device3 Min Filter }

  D3DPTFILTERCAPS_MINFPOINT       = $00000100;
  D3DPTFILTERCAPS_MINFLINEAR      = $00000200;
  D3DPTFILTERCAPS_MINFANISOTROPIC = $00000400;

{ Device3 Mip Filter }

  D3DPTFILTERCAPS_MIPFPOINT       = $00010000;
  D3DPTFILTERCAPS_MIPFLINEAR      = $00020000;

{ Device3 Mag Filter }

  D3DPTFILTERCAPS_MAGFPOINT         = $01000000;
  D3DPTFILTERCAPS_MAGFLINEAR        = $02000000;
  D3DPTFILTERCAPS_MAGFANISOTROPIC   = $04000000;
  D3DPTFILTERCAPS_MAGFAFLATCUBIC    = $08000000;
  D3DPTFILTERCAPS_MAGFGAUSSIANCUBIC = $10000000;

{ TD3DPrimCaps dwTextureBlendCaps }

  D3DPTBLENDCAPS_DECAL            = $00000001;
  D3DPTBLENDCAPS_MODULATE         = $00000002;
  D3DPTBLENDCAPS_DECALALPHA       = $00000004;
  D3DPTBLENDCAPS_MODULATEALPHA    = $00000008;
  D3DPTBLENDCAPS_DECALMASK        = $00000010;
  D3DPTBLENDCAPS_MODULATEMASK     = $00000020;
  D3DPTBLENDCAPS_COPY             = $00000040;
  D3DPTBLENDCAPS_ADD              = $00000080;

{ TD3DPrimCaps dwTextureAddressCaps }

  D3DPTADDRESSCAPS_WRAP           = $00000001;
  D3DPTADDRESSCAPS_MIRROR         = $00000002;
  D3DPTADDRESSCAPS_CLAMP          = $00000004;
  D3DPTADDRESSCAPS_BORDER         = $00000008;
  D3DPTADDRESSCAPS_INDEPENDENTUV  = $00000010;

{ D3DDEVICEDESC dwStencilCaps }

  D3DSTENCILCAPS_KEEP    = $00000001;
  D3DSTENCILCAPS_ZERO    = $00000002;
  D3DSTENCILCAPS_REPLACE = $00000004;
  D3DSTENCILCAPS_INCRSAT = $00000008;
  D3DSTENCILCAPS_DECRSAT = $00000010;
  D3DSTENCILCAPS_INVERT  = $00000020;
  D3DSTENCILCAPS_INCR    = $00000040;
  D3DSTENCILCAPS_DECR    = $00000080;

{ D3DDEVICEDESC dwTextureOpCaps }

  D3DTEXOPCAPS_DISABLE                    = $00000001;
  D3DTEXOPCAPS_SELECTARG1                 = $00000002;
  D3DTEXOPCAPS_SELECTARG2                 = $00000004;
  D3DTEXOPCAPS_MODULATE                   = $00000008;
  D3DTEXOPCAPS_MODULATE2X                 = $00000010;
  D3DTEXOPCAPS_MODULATE4X                 = $00000020;
  D3DTEXOPCAPS_ADD                        = $00000040;
  D3DTEXOPCAPS_ADDSIGNED                  = $00000080;
  D3DTEXOPCAPS_ADDSIGNED2X                = $00000100;
  D3DTEXOPCAPS_SUBTRACT                   = $00000200;
  D3DTEXOPCAPS_ADDSMOOTH                  = $00000400;
  D3DTEXOPCAPS_BLENDDIFFUSEALPHA          = $00000800;
  D3DTEXOPCAPS_BLENDTEXTUREALPHA          = $00001000;
  D3DTEXOPCAPS_BLENDFACTORALPHA           = $00002000;
  D3DTEXOPCAPS_BLENDTEXTUREALPHAPM        = $00004000;
  D3DTEXOPCAPS_BLENDCURRENTALPHA          = $00008000;
  D3DTEXOPCAPS_PREMODULATE                = $00010000;
  D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR     = $00020000;
  D3DTEXOPCAPS_MODULATECOLOR_ADDALPHA     = $00040000;
  D3DTEXOPCAPS_MODULATEINVALPHA_ADDCOLOR  = $00080000;
  D3DTEXOPCAPS_MODULATEINVCOLOR_ADDALPHA  = $00100000;
  D3DTEXOPCAPS_BUMPENVMAP                 = $00200000;
  D3DTEXOPCAPS_BUMPENVMAPLUMINANCE        = $00400000;
  D3DTEXOPCAPS_DOTPRODUCT3                = $00800000;

{ D3DDEVICEDESC dwFVFCaps flags }

  D3DFVFCAPS_TEXCOORDCOUNTMASK  = $0000ffff; // mask for texture coordinate count field
  D3DFVFCAPS_DONOTSTRIPELEMENTS = $00080000; // Device prefers that vertex elements not be stripped

{ Description for a device. }

type
  PD3DDeviceDesc_DX3 = ^TD3DDeviceDesc_DX3;
  TD3DDeviceDesc_DX3 = record
    dwSize: DWORD;                       // Size of D3DDEVICEDESC structure
    dwFlags: DWORD;                      // Indicates which fields have valid data
    dcmColorModel: TD3DColorModel;        // Color model of device
    dwDevCaps: DWORD;                    // Capabilities of device
    dtcTransformCaps: TD3DTransformCaps; // Capabilities of transform
    bClipping: BOOL;                     // Device can do 3D clipping
    dlcLightingCaps: TD3DLightingCaps;   // Capabilities of lighting
    dpcLineCaps: TD3DPrimCaps;
    dpcTriCaps: TD3DPrimCaps;
    dwDeviceRenderBitDepth: DWORD;       // One of DDBB_8, 16, etc..
    dwDeviceZBufferBitDepth: DWORD;      // One of DDBD_16, 32, etc..
    dwMaxBufferSize: DWORD;              // Maximum execute buffer size
    dwMaxVertexCount: DWORD;             // Maximum vertex count
  end;

  PD3DDeviceDesc_DX5 = ^TD3DDeviceDesc_DX5;
  TD3DDeviceDesc_DX5 = record
    dwSize: DWORD;                       // Size of D3DDEVICEDESC structure
    dwFlags: DWORD;                      // Indicates which fields have valid data
    dcmColorModel: TD3DColorModel;        // Color model of device
    dwDevCaps: DWORD;                    // Capabilities of device
    dtcTransformCaps: TD3DTransformCaps; // Capabilities of transform
    bClipping: BOOL;                     // Device can do 3D clipping
    dlcLightingCaps: TD3DLightingCaps;   // Capabilities of lighting
    dpcLineCaps: TD3DPrimCaps;
    dpcTriCaps: TD3DPrimCaps;
    dwDeviceRenderBitDepth: DWORD;       // One of DDBB_8, 16, etc..
    dwDeviceZBufferBitDepth: DWORD;      // One of DDBD_16, 32, etc..
    dwMaxBufferSize: DWORD;              // Maximum execute buffer size
    dwMaxVertexCount: DWORD;             // Maximum vertex count
    // New fields for DX5
    // Width and height caps are 0 for legacy HALs.
    dwMinTextureWidth, dwMinTextureHeight  : DWORD;
    dwMaxTextureWidth, dwMaxTextureHeight  : DWORD;
    dwMinStippleWidth, dwMaxStippleWidth   : DWORD;
    dwMinStippleHeight, dwMaxStippleHeight : DWORD;
  end;

  PD3DDeviceDesc_DX6 = ^TD3DDeviceDesc_DX6;
  TD3DDeviceDesc_DX6 = record
    dwSize: DWORD;                       // Size of D3DDEVICEDESC structure
    dwFlags: DWORD;                      // Indicates which fields have valid data
    dcmColorModel: TD3DColorModel;        // Color model of device
    dwDevCaps: DWORD;                    // Capabilities of device
    dtcTransformCaps: TD3DTransformCaps; // Capabilities of transform
    bClipping: BOOL;                     // Device can do 3D clipping
    dlcLightingCaps: TD3DLightingCaps;   // Capabilities of lighting
    dpcLineCaps: TD3DPrimCaps;
    dpcTriCaps: TD3DPrimCaps;
    dwDeviceRenderBitDepth: DWORD;       // One of DDBB_8, 16, etc..
    dwDeviceZBufferBitDepth: DWORD;      // One of DDBD_16, 32, etc..
    dwMaxBufferSize: DWORD;              // Maximum execute buffer size
    dwMaxVertexCount: DWORD;             // Maximum vertex count

    // New fields for DX5
    // Width and height caps are 0 for legacy HALs.
    dwMinTextureWidth, dwMinTextureHeight  : DWORD;
    dwMaxTextureWidth, dwMaxTextureHeight  : DWORD;
    dwMinStippleWidth, dwMaxStippleWidth   : DWORD;
    dwMinStippleHeight, dwMaxStippleHeight : DWORD;

    // New fields for DX6
    dwMaxTextureRepeat: DWORD;
    dwMaxTextureAspectRatio: DWORD;
    dwMaxAnisotropy: DWORD;

    // Guard band that the rasterizer can accommodate
    // Screen-space vertices inside this space but outside the viewport
    // will get clipped properly.
    dvGuardBandLeft: TD3DValue;
    dvGuardBandTop: TD3DValue;
    dvGuardBandRight: TD3DValue;
    dvGuardBandBottom: TD3DValue;
    dvExtentsAdjust: TD3DValue;
    dwStencilCaps: DWORD;
    dwFVFCaps: DWORD;           // low 4 bits: 0 implies TLVERTEX only, 1..8 imply FVF aware
    dwTextureOpCaps: DWORD;
    wMaxTextureBlendStages: Word;
    wMaxSimultaneousTextures: Word;
  end;

{$IFDEF DirectX3}
  TD3DDeviceDesc = TD3DDeviceDesc_DX3;
  PD3DDeviceDesc = PD3DDeviceDesc_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TD3DDeviceDesc = TD3DDeviceDesc_DX5;
  PD3DDeviceDesc = PD3DDeviceDesc_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TD3DDeviceDesc = TD3DDeviceDesc_DX6;
  PD3DDeviceDesc = PD3DDeviceDesc_DX6;
{$ENDIF}

  D3DDEVICEDESC = TD3DDeviceDesc;
  LPD3DDEVICEDESC = PD3DDeviceDesc;

type
  TD3DEnumDevicesCallback = function(const lpGuid: TGUID;
      lpDeviceDescription: LPSTR; lpDeviceName: LPSTR;
      const lpD3DHWDeviceDesc: TD3DDeviceDesc;
      const lpD3DHELDeviceDesc: TD3DDeviceDesc;
      lpUserArg: Pointer): HResult; stdcall;

  LPD3DENUMDEVICESCALLBACK = TD3DEnumDevicesCallback;

{ TD3DDeviceDesc dwFlags indicating valid fields }

const
  D3DDD_COLORMODEL            = $00000001; // dcmColorModel is valid
  D3DDD_DEVCAPS               = $00000002; // dwDevCaps is valid
  D3DDD_TRANSFORMCAPS         = $00000004; // dtcTransformCaps is valid
  D3DDD_LIGHTINGCAPS          = $00000008; // dlcLightingCaps is valid
  D3DDD_BCLIPPING             = $00000010; // bClipping is valid
  D3DDD_LINECAPS              = $00000020; // dpcLineCaps is valid
  D3DDD_TRICAPS               = $00000040; // dpcTriCaps is valid
  D3DDD_DEVICERENDERBITDEPTH  = $00000080; // dwDeviceRenderBitDepth is valid
  D3DDD_DEVICEZBUFFERBITDEPTH = $00000100; // dwDeviceZBufferBitDepth is valid
  D3DDD_MAXBUFFERSIZE         = $00000200; // dwMaxBufferSize is valid
  D3DDD_MAXVERTEXCOUNT        = $00000400; // dwMaxVertexCount is valid

{ TD3DDeviceDesc dwDevCaps flags }

  D3DDEVCAPS_FLOATTLVERTEX           = $00000001; // Device accepts floating point
                                                  // for post-transform vertex data
  D3DDEVCAPS_SORTINCREASINGZ         = $00000002; // Device needs data sorted for increasing Z
  D3DDEVCAPS_SORTDECREASINGZ         = $00000004; // Device needs data sorted for decreasing Z
  D3DDEVCAPS_SORTEXACT               = $00000008; // Device needs data sorted exactly

  D3DDEVCAPS_EXECUTESYSTEMMEMORY     = $00000010; // Device can use execute buffers from system memory
  D3DDEVCAPS_EXECUTEVIDEOMEMORY      = $00000020; // Device can use execute buffers from video memory
  D3DDEVCAPS_TLVERTEXSYSTEMMEMORY    = $00000040; // Device can use TL buffers from system memory
  D3DDEVCAPS_TLVERTEXVIDEOMEMORY     = $00000080; // Device can use TL buffers from video memory
  D3DDEVCAPS_TEXTURESYSTEMMEMORY     = $00000100; // Device can texture from system memory
  D3DDEVCAPS_TEXTUREVIDEOMEMORY      = $00000200; // Device can texture from device memory
  D3DDEVCAPS_DRAWPRIMTLVERTEX        = $00000400; // Device can draw TLVERTEX primitives
  D3DDEVCAPS_CANRENDERAFTERFLIP      = $00000800; // Device can render without waiting for flip to complete
  D3DDEVCAPS_TEXTURENONLOCALVIDMEM   = $00001000; // Device can texture from nonlocal video memory
  D3DDEVCAPS_DRAWPRIMITIVES2         = $00002000; // Device can support DrawPrimitives2
  D3DDEVCAPS_SEPARATETEXTUREMEMORIES = $00004000; // Device is texturing from separate memory pools

  D3DFDS_COLORMODEL         = $00000001; // Match color model
  D3DFDS_GUID               = $00000002; // Match guid
  D3DFDS_HARDWARE           = $00000004; // Match hardware/software
  D3DFDS_TRIANGLES          = $00000008; // Match in triCaps
  D3DFDS_LINES              = $00000010; // Match in lineCaps
  D3DFDS_MISCCAPS           = $00000020; // Match primCaps.dwMiscCaps
  D3DFDS_RASTERCAPS         = $00000040; // Match primCaps.dwRasterCaps
  D3DFDS_ZCMPCAPS           = $00000080; // Match primCaps.dwZCmpCaps
  D3DFDS_ALPHACMPCAPS       = $00000100; // Match primCaps.dwAlphaCmpCaps
  D3DFDS_SRCBLENDCAPS       = $00000200; // Match primCaps.dwSourceBlendCaps
  D3DFDS_DSTBLENDCAPS       = $00000400; // Match primCaps.dwDestBlendCaps
  D3DFDS_SHADECAPS          = $00000800; // Match primCaps.dwShadeCaps
  D3DFDS_TEXTURECAPS        = $00001000; // Match primCaps.dwTextureCaps
  D3DFDS_TEXTUREFILTERCAPS  = $00002000; // Match primCaps.dwTextureFilterCaps
  D3DFDS_TEXTUREBLENDCAPS   = $00004000; // Match primCaps.dwTextureBlendCaps
  D3DFDS_TEXTUREADDRESSCAPS = $00008000; // Match primCaps.dwTextureBlendCaps

{ FindDevice arguments }

type
  PD3DFindDeviceSearch = ^TD3DFindDeviceSearch;
  TD3DFindDeviceSearch = record
    dwSize: DWORD;
    dwFlags: DWORD;
    bHardware: BOOL;
    dcmColorModel: TD3DColorModel;
    guid: TGUID;
    dwCaps: DWORD;
    dpcPrimCaps: TD3DPrimCaps;
  end;

  D3DFINDDEVICESEARCH = TD3DFindDeviceSearch;
  LPD3DFINDDEVICESEARCH = PD3DFindDeviceSearch;

  PD3DFindDeviceResult = ^TD3DFindDeviceResult;
  TD3DFindDeviceResult = record
    dwSize: DWORD;
    guid: TGUID;               // guid which matched
    ddHwDesc: TD3DDeviceDesc;   // hardware TD3DDeviceDesc
    ddSwDesc: TD3DDeviceDesc;   // software TD3DDeviceDesc
  end;

  D3DFINDDEVICERESULT = TD3DFindDeviceResult;
  LPD3DFINDDEVICERESULT = PD3DFindDeviceResult;

{ Description of execute buffer. }

  PD3DExecuteBufferDesc = ^TD3DExecuteBufferDesc;
  TD3DExecuteBufferDesc = record
    dwSize: DWORD;         // size of this structure
    dwFlags: DWORD;        // flags indicating which fields are valid
    dwCaps: DWORD;         // capabilities of execute buffer
    dwBufferSize: DWORD;   // size of execute buffer data
    lpData: Pointer;       // pointer to actual data
  end;

  D3DEXECUTEBUFFERDESC = TD3DExecuteBufferDesc;
  LPD3DEXECUTEBUFFERDESC = PD3DExecuteBufferDesc;

{ D3DEXECUTEBUFFER dwFlags indicating valid fields }

const
  D3DDEB_BUFSIZE          = $00000001;     // buffer size valid
  D3DDEB_CAPS             = $00000002;     // caps valid
  D3DDEB_LPDATA           = $00000004;     // lpData valid

{ D3DEXECUTEBUFFER dwCaps }

  D3DDEBCAPS_SYSTEMMEMORY = $00000001;     // buffer in system memory
  D3DDEBCAPS_VIDEOMEMORY  = $00000002;     // buffer in device memory
  D3DDEBCAPS_MEM          = D3DDEBCAPS_SYSTEMMEMORY or D3DDEBCAPS_VIDEOMEMORY;

(*==========================================================================;
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       d3d.h
 *  Content:    Direct3D include file
 *
 ***************************************************************************)

{ Interface IID's }

const
  IID_IDirect3D: TGUID = '{3BBA0080-2421-11CF-A31A-00AA00B93356}';
  IID_IDirect3D2: TGUID = '{6AAE1EC1-662A-11D0-889D-00AA00BBB76A}';
  IID_IDirect3D3: TGUID = '{BB223240-E72B-11D0-A9B4-00AA00C0993E}';

  IID_IDirect3DRampDevice: TGUID = '{F2086B20-259F-11CF-A31A-00AA00B93356}';
  IID_IDirect3DRGBDevice: TGUID = '{A4665C60-2673-11CF-A31A-00AA00B93356}';
  IID_IDirect3DHALDevice: TGUID = '{84E63DE0-46AA-11CF-816F-0000C020156E}';
  IID_IDirect3DMMXDevice: TGUID = '{881949A1-D6F3-11D0-89AB-00A0C9054129}';
  IID_IDirect3DRefDevice: TGUID = '{50936643-13E9-11D1-89AA-00A0C9054129}';
  IID_IDirect3DNullDevice: TGUID = '{8767DF22-BACC-11D1-8969-00A0C90629A8}';

  IID_IDirect3DDevice: TGUID = '{64108800-957D-11D0-89AB-00A0C9054129}';
  IID_IDirect3DDevice2: TGUID = '{93281501-8CF8-11D0-89AB-00A0C9054129}';
  IID_IDirect3DDevice3: TGUID = '{B0AB3B60-33D7-11D1-A981-00C04FD7B174}';
  IID_IDirect3DTexture: TGUID ='{2CDCD9E0-25A0-11CF-A31A-00AA00B93356}';
  IID_IDirect3DTexture2: TGUID = '{93281502-8CF8-11D0-89AB-00A0C9054129}';
  IID_IDirect3DLight: TGUID = '{4417C142-33AD-11CF-816F-0000C020156E}';
  IID_IDirect3DMaterial: TGUID = '{4417C144-33AD-11CF-816F-0000C020156E}';
  IID_IDirect3DMaterial2: TGUID = '{93281503-8CF8-11D0-89AB-00A0C9054129}';
  IID_IDirect3DMaterial3: TGUID = '{CA9C46F4-D3C5-11D1-B75A-00600852B312}';
  IID_IDirect3DExecuteBuffer: TGUID = '{4417C145-33AD-11CF-816F-0000C020156E}';
  IID_IDirect3DViewport: TGUID = '{4417C146-33AD-11CF-816F-0000C020156E}';
  IID_IDirect3DViewport2: TGUID = '{93281500-8CF8-11D0-89AB-00A0C9054129}';
  IID_IDirect3DViewport3: TGUID = '{B0AB3B61-33D7-11D1-A981-00C04FD7B174}';
  IID_IDirect3DVertexBuffer: TGUID = '{7A503555-4A83-11D1-A5DB-00A0C90367F8}';

{ Data structures }

type
  IDirect3D = interface;
  IDirect3D2 = interface;
  IDirect3D3 = interface;
  IDirect3DDevice = interface;
  IDirect3DDevice2 = interface;
  IDirect3DDevice3 = interface;
  IDirect3DExecuteBuffer = interface;
  IDirect3DLight = interface;
  IDirect3DMaterial = interface;
  IDirect3DMaterial2 = interface;
  IDirect3DMaterial3 = interface;
  IDirect3DTexture = interface;
  IDirect3DTexture2 = interface;
  IDirect3DViewport = interface;
  IDirect3DViewport2 = interface;
  IDirect3DViewport3 = interface;
  IDirect3DVertexBuffer = interface;

  IDirect3D = interface(IUnknown)
    ['{3BBA0080-2421-11CF-A31A-00AA00B93356}']
    // IDirect3D methods
    function Initialize(const lpREFIID: TGUID): HResult; stdcall;
    function EnumDevices(lpEnumDevicesCallback: TD3DEnumDevicesCallback;
        lpUserArg: Pointer): HResult; stdcall;
    function CreateLight(out lplpDirect3Dlight: IDirect3DLight;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateMaterial(out lplpDirect3DMaterial: IDirect3DMaterial;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateViewport(out lplpD3DViewport: IDirect3DViewport;
        pUnkOuter: IUnknown): HResult; stdcall;
    function FindDevice(const lpD3DFDS: TD3DFindDeviceSearch;
        var lpD3DFDR: TD3DFindDeviceResult): HResult; stdcall;
  end;

  IDirect3D2 = interface(IUnknown)
    ['{6AAE1EC1-662A-11D0-889D-00AA00BBB76A}']
    // IDirect3D methods
    function EnumDevices(lpEnumDevicesCallback: TD3DEnumDevicesCallback;
        lpUserArg: Pointer): HResult; stdcall;
    function CreateLight(out lplpDirect3Dlight: IDirect3DLight;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateMaterial(out lplpDirect3DMaterial: IDirect3DMaterial2;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateViewport(out lplpD3DViewport: IDirect3DViewport2;
        pUnkOuter: IUnknown ): HResult; stdcall;
    function FindDevice(const lpD3DFDS: TD3DFindDeviceSearch;
        var lpD3DFDR: TD3DFindDeviceResult): HResult; stdcall;
    // IDirect3D2 methods
    function CreateDevice(const rclsid: TGUID; lpDDS: IDirectDrawSurface;
        out lplpD3DDevice2: IDirect3DDevice2): HResult; stdcall;
  end;

  IDirect3D3 = interface(IUnknown)
    ['{BB223240-E72B-11D0-A9B4-00AA00C0993E}']
    // IDirect3D methods
    function EnumDevices(lpEnumDevicesCallback: TD3DEnumDevicesCallback;
        lpUserArg: Pointer): HResult; stdcall;
    function CreateLight(out lplpDirect3Dlight: IDirect3DLight;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateMaterial(out lplpDirect3DMaterial: IDirect3DMaterial2;
        pUnkOuter: IUnknown): HResult; stdcall;
    function CreateViewport(out lplpD3DViewport: IDirect3DViewport3;
        pUnkOuter: IUnknown ): HResult; stdcall;
    function FindDevice(const lpD3DFDS: TD3DFindDeviceSearch;
        var lpD3DFDR: TD3DFindDeviceResult): HResult; stdcall;
    // IDirect3D2 methods
    function CreateDevice(const rclsid: TGUID; lpDDS: IDirectDrawSurface4;
        out lplpD3DDevice2: IDirect3DDevice3): HResult; stdcall;
    // IDirect3D3 methods
    function EnumZBufferFormats(const riidDevice: TGUID; lpEnumCallback: TD3DEnumPixelFormatsCallback;
      lpContext: Pointer): HResult; stdcall;
    function EvictManagedTextures: HResult; stdcall;
  end;

  IDirect3DDevice = interface(IUnknown)
    ['{64108800-957D-11D0-89AB-00A0C9054129}']
    // IDirect3DDevice methods
    function Initialize(lpd3d: IDirect3D; const lpGUID: TGUID;
        const lpd3ddvdesc: TD3DDeviceDesc): HResult; stdcall;
    function GetCaps(var lpD3DHWDevDesc: TD3DDeviceDesc;
        var lpD3DHELDevDesc: TD3DDeviceDesc): HResult; stdcall;
    function SwapTextureHandles(lpD3DTex1: IDirect3DTexture;
        lpD3DTex2: IDirect3DTexture): HResult; stdcall;
    function CreateExecuteBuffer(const lpDesc: TD3DExecuteBufferDesc;
        out lplpDirect3DExecuteBuffer: IDirect3DExecuteBuffer;
        pUnkOuter: IUnknown): HResult; stdcall;
    function GetStats(var lpD3DStats: TD3DStats): HResult; stdcall;
    function Execute(lpDirect3DExecuteBuffer: IDirect3DExecuteBuffer;
        lpDirect3DViewport: IDirect3DViewport; dwFlags: DWORD): HResult; stdcall;
    function AddViewport(lpDirect3DViewport: IDirect3DViewport): HResult; stdcall;
    function DeleteViewport(lpDirect3DViewport: IDirect3DViewport): HResult; stdcall;
    function NextViewport(lpDirect3DViewport: IDirect3DViewport;
        out lplpDirect3DViewport: IDirect3DViewport; dwFlags: DWORD): HResult; stdcall;
    function Pick(lpDirect3DExecuteBuffer: IDirect3DExecuteBuffer;
        lpDirect3DViewport: IDirect3DViewport; dwFlags: DWORD;
        const lpRect: TD3DRect): HResult; stdcall;
    function GetPickRecords(var lpCount: DWORD;
        var lpD3DPickRec: TD3DPickRecord): HResult; stdcall;
    function EnumTextureFormats(lpd3dEnumTextureProc: TD3DEnumTextureFormatsCalback;
        lpArg: Pointer): HResult; stdcall;
    function CreateMatrix(var lpD3DMatHandle: TD3DMatrixHandle): HResult; stdcall;
    function SetMatrix(d3dMatHandle: TD3DMatrixHandle;
        const lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function GetMatrix(lpD3DMatHandle: TD3DMatrixHandle;
        var lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function DeleteMatrix(d3dMatHandle: TD3DMatrixHandle): HResult; stdcall;
    function BeginScene: HResult; stdcall;
    function EndScene: HResult; stdcall;
    function GetDirect3D(out lpD3D: IDirect3D): HResult; stdcall;
  end;

  IDirect3DDevice2 = interface(IUnknown)
    ['{93281501-8CF8-11D0-89AB-00A0C9054129}']
    // IDirect3DDevice2 methods
    function GetCaps(var lpD3DHWDevDesc: TD3DDeviceDesc;
        var lpD3DHELDevDesc: TD3DDeviceDesc): HResult; stdcall;
    function SwapTextureHandles(lpD3DTex1: IDirect3DTexture2;
        lpD3DTex2: IDirect3DTexture2): HResult; stdcall;
    function GetStats(var lpD3DStats: TD3DStats): HResult; stdcall;
    function AddViewport(lpDirect3DViewport: IDirect3DViewport2): HResult; stdcall;
    function DeleteViewport(lpDirect3DViewport: IDirect3DViewport2): HResult; stdcall;
    function NextViewport(lpDirect3DViewport: IDirect3DViewport2;
        out lplpDirect3DViewport: IDirect3DViewport2; dwFlags: DWORD): HResult; stdcall;
    function EnumTextureFormats(lpd3dEnumTextureProc: TD3DEnumTextureFormatsCalback;
        lpArg: Pointer): HResult; stdcall;
    function BeginScene: HResult; stdcall;
    function EndScene: HResult; stdcall;
    function GetDirect3D(out lpD3D: IDirect3D2): HResult; stdcall;
    function SetCurrentViewport(lpd3dViewport2: IDirect3DViewport2): HResult; stdcall;
    function GetCurrentViewport(out lplpd3dViewport2: IDirect3DViewport2): HResult; stdcall;
    function SetRenderTarget(lpNewRenderTarget: IDirectDrawSurface): HResult; stdcall;
    function GetRenderTarget(out lplpNewRenderTarget: IDirectDrawSurface): HResult; stdcall;
    function Begin_(d3dpt: TD3DPrimitiveType; d3dvt: TD3DVertexType;
        dwFlags: DWORD): HResult; stdcall;
    function BeginIndexed(dptPrimitiveType: TD3DPrimitiveType; dvtVertexType:
        TD3DVertexType; const lpvVertices; dwNumVertices: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function Vertex(const lpVertexType): HResult; stdcall;
    function Index(wVertexIndex: WORD): HResult; stdcall;
    function End_(dwFlags: DWORD): HResult; stdcall;
    function GetRenderState(dwRenderStateType: TD3DRenderStateType;
        var lpdwRenderState: DWORD): HResult; stdcall;
    function SetRenderState(dwRenderStateType: TD3DRenderStateType;
        dwRenderState: DWORD): HResult; stdcall;
    function GetLightState(dwLightStateType: TD3DLightStateType;
        var lpdwLightState: DWORD): HResult; stdcall;
    function SetLightState(dwLightStateType: TD3DLightStateType;
        dwLightState: DWORD): HResult; stdcall;
    function SetTransform(dtstTransformStateType: TD3DTransformStateType;
        const lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function GetTransform(dtstTransformStateType: TD3DTransformStateType;
        var lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function MultiplyTransform(dtstTransformStateType: TD3DTransformStateType;
        var lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function DrawPrimitive(dptPrimitiveType: TD3DPrimitiveType;
        dvtVertexType: TD3DVertexType; const lpvVertices; dwVertexCount,
        dwFlags: DWORD): HResult; stdcall;
    function DrawIndexedPrimitive(dptPrimitiveType: TD3DPrimitiveType;
        dvtVertexType: TD3DVertexType; const lpvVertices;
        dwVertexCount: DWORD; const dwIndices; dwIndexCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function SetClipStatus(const lpD3DClipStatus: TD3DClipStatus): HResult; stdcall;
    function GetClipStatus(var lpD3DClipStatus: TD3DClipStatus): HResult; stdcall;
  end;

  IDirect3DDevice3 = interface(IUnknown)
    ['{B0AB3B60-33D7-11D1-A981-00C04FD7B174}']
    // IDirect3DDevice3 methods
    function GetCaps(var lpD3DHWDevDesc: TD3DDeviceDesc;
        var lpD3DHELDevDesc: TD3DDeviceDesc): HResult; stdcall;
    function GetStats(var lpD3DStats: TD3DStats): HResult; stdcall;
    function AddViewport(lpDirect3DViewport: IDirect3DViewport3): HResult; stdcall;
    function DeleteViewport(lpDirect3DViewport: IDirect3DViewport3): HResult; stdcall;
    function NextViewport(lpDirect3DViewport: IDirect3DViewport3;
        out lplpDirect3DViewport: IDirect3DViewport3; dwFlags: DWORD): HResult; stdcall;
    function EnumTextureFormats(lpd3dEnumTextureProc: TD3DEnumTextureFormatsCalback;
        lpArg: Pointer): HResult; stdcall;
    function BeginScene: HResult; stdcall;
    function EndScene: HResult; stdcall;
    function GetDirect3D(out lpD3D: IDirect3D3): HResult; stdcall;
    function SetCurrentViewport(lpd3dViewport: IDirect3DViewport3): HResult; stdcall;
    function GetCurrentViewport(out lplpd3dViewport: IDirect3DViewport3): HResult; stdcall;
    function SetRenderTarget(lpNewRenderTarget: IDirectDrawSurface4): HResult; stdcall;
    function GetRenderTarget(out lplpNewRenderTarget: IDirectDrawSurface4): HResult; stdcall;
    function Begin_(d3dpt: TD3DPrimitiveType; d3dvt: TD3DVertexType;
        dwFlags: DWORD): HResult; stdcall;
    function BeginIndexed(dptPrimitiveType: TD3DPrimitiveType; dvtVertexType:
        TD3DVertexType; const lpvVertices; dwNumVertices: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function Vertex(const lpVertexType): HResult; stdcall;
    function Index(wVertexIndex: WORD): HResult; stdcall;
    function End_(dwFlags: DWORD): HResult; stdcall;
    function GetRenderState(dwRenderStateType: TD3DRenderStateType;
        var lpdwRenderState: DWORD): HResult; stdcall;
    function SetRenderState(dwRenderStateType: TD3DRenderStateType;
        dwRenderState: DWORD): HResult; stdcall;
    function GetLightState(dwLightStateType: TD3DLightStateType;
        var lpdwLightState: DWORD): HResult; stdcall;
    function SetLightState(dwLightStateType: TD3DLightStateType;
        dwLightState: DWORD): HResult; stdcall;
    function SetTransform(dtstTransformStateType: TD3DTransformStateType;
        const lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function GetTransform(dtstTransformStateType: TD3DTransformStateType;
        var lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function MultiplyTransform(dtstTransformStateType: TD3DTransformStateType;
        var lpD3DMatrix: TD3DMatrix): HResult; stdcall;
    function DrawPrimitive(dptPrimitiveType: TD3DPrimitiveType;
        dvtVertexType: TD3DVertexType; const lpvVertices; dwVertexCount,
        dwFlags: DWORD): HResult; stdcall;
    function DrawIndexedPrimitive(dptPrimitiveType: TD3DPrimitiveType;
        dvtVertexType: TD3DVertexType; const lpvVertices;
        dwVertexCount: DWORD; const dwIndices; dwIndexCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function SetClipStatus(const lpD3DClipStatus: TD3DClipStatus): HResult; stdcall;
    function GetClipStatus(var lpD3DClipStatus: TD3DClipStatus): HResult; stdcall;
    function DrawPrimitiveStrided(dptPrimitiveType: TD3DPrimitiveType;
        dwVertexTypeDesc: DWORD; const lpVertexArray;
        dwVertexCount: DWORD; dwFlags: DWORD): HResult; stdcall;
    function DrawIndexedPrimitiveStrided(dptPrimitiveType: TD3DPrimitiveType;
        dwVertexTypeDesc: DWORD; const lpVertexArray;
        dwVertexCount: DWORD; const lpwIndices; dwIndexCount: DWORD; dwFlags: DWORD): HResult; stdcall;
    function DrawPrimitiveVB(dptPrimitiveType: TD3DPrimitiveType;
        lpd3dVertexBuffer: IDirect3DVertexBuffer; dwStartVertex, dwNumVertices: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function DrawIndexedPrimitiveVB(dptPrimitiveType: TD3DPrimitiveType;
        lpd3dVertexBuffer: IDirect3DVertexBuffer; const lpwIndices; dwIndexCount: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function ComputeSphereVisibility(const lpCenters; const lpRadii;
        dwNumSpheres: DWORD; dwFlags: DWORD; var lpdwReturnValues): HResult; stdcall;
    function GetTexture(dwStage: DWORD; out lplpTexture: IDirect3DTexture2): HResult; stdcall;
    function SetTexture(dwStage: DWORD; lpTexture: IDirect3DTexture2): HResult; stdcall;
    function GetTextureStageStage(dwStage: DWORD; dwState: TD3DTextureStagesStateType;
       var lpdwValue: DWORD): HResult; stdcall;
    function SetTextureStageStage(dwStage: DWORD; dwState: TD3DTextureStagesStateType;
       lpdwValue: DWORD): HResult; stdcall;
    function ValidateDevice(var lpdwPasses: DWORD): HResult; stdcall;
  end;

  IDirect3DExecuteBuffer = interface(IUnknown)
    ['{4417C145-33AD-11CF-816F-0000C020156E}']
    // IDirect3DExecuteBuffer methods
    function Initialize(lpDirect3DDevice: IDirect3DDevice;
        const lpDesc: TD3DExecuteBufferDesc): HResult; stdcall;
    function Lock(var lpDesc: TD3DExecuteBufferDesc): HResult; stdcall;
    function Unlock: HResult; stdcall;
    function SetExecuteData(const lpData: TD3DExecuteData): HResult; stdcall;
    function GetExecuteData(var lpData: TD3DExecuteData): HResult; stdcall;
    function Validate(var lpdwOffset: DWORD; lpFunc: TD3DValidateCallback;
        lpUserArg: Pointer; dwReserved: DWORD): HResult; stdcall;
    function Optimize(dwFlags: DWORD): HResult; stdcall;
  end;

  IDirect3DLight = interface(IUnknown)
    ['{4417C142-33AD-11CF-816F-0000C020156E}']
    // IDirect3DLight methods
    function Initialize(lpDirect3D: IDirect3D): HResult; stdcall;
    function SetLight(const lpLight: TD3DLight): HResult; stdcall;
    function GetLight(var lpLight: TD3DLight): HResult; stdcall;
  end;

  IDirect3DMaterial = interface(IUnknown)
    ['{4417C144-33AD-11CF-816F-0000C020156E}']
    // IDirect3DMaterial methods
    function Initialize(lpDirect3D: IDirect3D): HResult; stdcall;
    function SetMaterial(const lpMat: TD3DMaterial): HResult; stdcall;
    function GetMaterial(var lpMat: TD3DMaterial): HResult; stdcall;
    function GetHandle(lpDirect3DDevice: IDirect3DDevice;
        var lpHandle: TD3DMaterialHandle): HResult; stdcall;
    function Reserve: HResult; stdcall;
    function Unreserve: HResult; stdcall;
  end;

  IDirect3DMaterial2 = interface(IUnknown)
    ['{93281503-8CF8-11D0-89AB-00A0C9054129}']
    // IDirect3DMaterial2 methods
    function SetMaterial(const lpMat: TD3DMaterial): HResult; stdcall;
    function GetMaterial(var lpMat: TD3DMaterial): HResult; stdcall;
    function GetHandle(lpDirect3DDevice: IDirect3DDevice2;
        var lpHandle: TD3DMaterialHandle): HResult; stdcall;
  end;

  IDirect3DMaterial3 = interface(IUnknown)
    ['{CA9C46F4-D3C5-11D1-B75A-00600852B312}']
    // IDirect3DMaterial3 methods
    function SetMaterial(const lpMat: TD3DMaterial): HResult; stdcall;
    function GetMaterial(var lpMat: TD3DMaterial): HResult; stdcall;
    function GetHandle(lpDirect3DDevice: IDirect3DDevice3;
        var lpHandle: TD3DMaterialHandle): HResult; stdcall;
  end;

  IDirect3DTexture = interface(IUnknown)
    ['{2CDCD9E0-25A0-11CF-A31A-00AA00B93356}']
    // IDirect3DTexture methods
    function Initialize(lpD3DDevice: IDirect3DDevice;
        lpDDSurface: IDirectDrawSurface): HResult; stdcall;
    function GetHandle(lpDirect3DDevice: IDirect3DDevice;
        var lpHandle: TD3DTextureHandle): HResult; stdcall;
    function PaletteChanged(dwStart: DWORD; dwCount: DWORD): HResult; stdcall;
    function Load(lpD3DTexture: IDirect3DTexture): HResult; stdcall;
    function Unload: HResult; stdcall;
  end;

  IDirect3DTexture2 = interface(IUnknown)
    ['{93281502-8CF8-11D0-89AB-00A0C9054129}']
    // IDirect3DTexture2 methods
    function GetHandle(lpDirect3DDevice2: IDirect3DDevice2;
        var lpHandle: TD3DTextureHandle): HResult; stdcall;
    function PaletteChanged(dwStart: DWORD; dwCount: DWORD): HResult; stdcall;
    function Load(lpD3DTexture2: IDirect3DTexture2): HResult; stdcall;
  end;

  IDirect3DViewport = interface(IUnknown)
    ['{4417C146-33AD-11CF-816F-0000C020156E}']
    // IDirect3DViewport methods
    function Initialize(lpDirect3D: IDirect3D): HResult; stdcall;
    function GetViewport(var lpData: TD3DViewport): HResult; stdcall;
    function SetViewport(const lpData: TD3DViewport): HResult; stdcall;
    function TransformVertices(dwVertexCount: DWORD;
        var lpData: TD3DTransformData; dwFlags: DWORD;
        var lpOffscreen: DWORD): HResult; stdcall;
    function LightElements(dwElementCount: DWORD;
        var lpData: TD3DLightData): HResult; stdcall;
    function SetBackground(hMat: TD3DMaterialHandle): HResult; stdcall;
    function GetBackground(hMat: TD3DMaterialHandle): HResult; stdcall;
    function SetBackgroundDepth(lpDDSurface: IDirectDrawSurface): HResult; stdcall;
    function GetBackgroundDepth(out lplpDDSurface: IDirectDrawSurface;
        var lpValid: BOOL): HResult; stdcall;
    function Clear(dwCount: DWORD; const lpRects: TD3DRect; dwFlags: DWORD): HResult; stdcall;
    function AddLight(lpDirect3DLight: IDirect3DLight): HResult; stdcall;
    function DeleteLight(lpDirect3DLight: IDirect3DLight): HResult; stdcall;
    function NextLight(lpDirect3DLight: IDirect3DLight;
        out lplpDirect3DLight: IDirect3DLight; dwFlags: DWORD): HResult; stdcall;
  end;

  IDirect3DViewport2 = interface(IDirect3DViewport)
    ['{93281500-8CF8-11D0-89AB-00A0C9054129}']
    // IDirect3DViewport2 methods
    function GetViewport2(var lpData: TD3DViewport2): HResult; stdcall;
    function SetViewport2(const lpData: TD3DViewport2): HResult; stdcall;
  end;

  IDirect3DViewport3 = interface(IDirect3DViewport2)
    ['{B0AB3B61-33D7-11D1-A981-00C04FD7B174}']
    // IDirect3DViewport3 methods
    function SetBackgroundDepth2(lpDDS: IDirectDrawSurface4): HResult; stdcall;
    function GetBackgroundDepth2(out lplpDDS: IDirectDrawSurface4; var lpValid: BOOL): HResult; stdcall;
    function Clear2(dwCount: DWORD; const lpRects: TD3DRect; dwFlags: DWORD;
        dwColor: DWORD; dvZ: TD3DValue; dwStencil: DWORD): HResult; stdcall;
  end;

  IDirect3DVertexBuffer = interface(IUnknown)
    ['{7A503555-4A83-11D1-A5DB-00A0C90367F8}']
    // IDirect3DVertexBuffer methods
    function Lock(dwFlags: DWORD; var lplpData: Pointer; var lpdwSize: DWORD): HResult; stdcall;
    function Unlock: HResult; stdcall;
    function ProcessVertices(dwVertexOp: DWORD; dwDestIndex: DWORD; dwCount: DWORD;
      lpSrcBuffer: IDirect3DVertexBuffer; dwSrcIndex: DWORD;
      lpD3DDevice: IDirect3DDevice3; dwFlags: DWORD): HResult; stdcall;
    function GetVertexBufferDesc(var lpVBDesc: TD3DVertexBufferDesc): HResult; stdcall;
    function Optimize(lpD3DDevice: IDirect3DDevice3; dwFlags: DWORD): HResult; stdcall;
  end;

const

{ Flags for IDirect3DDevice::NextViewport }

  D3DNEXT_NEXT =        $00000001;
  D3DNEXT_HEAD =        $00000002;
  D3DNEXT_TAIL =        $00000004;

{ Flags for DrawPrimitive/DrawIndexedPrimitive
   Also valid for Begin/BeginIndexed }

  D3DDP_WAIT               = $00000001;
  D3DDP_OUTOFORDER         = $00000002;
  D3DDP_DONOTCLIP          = $00000004;
  D3DDP_DONOTUPDATEEXTENTS = $00000008;
  D3DDP_DONOTLIGHT         = $00000010;

{ Direct3D Errors }

const
  D3D_OK                  = DD_OK;
  D3DERR_BADMAJORVERSION  = $88760000 + 700;
  D3DERR_BADMINORVERSION  = $88760000 + 701;

{ An invalid device was requested by the application. }

  D3DERR_INVALID_DEVICE   = $88760000 + 705;
  D3DERR_INITFAILED       = $88760000 + 706;

{ SetRenderTarget attempted on a device that was
  QI'd off the render target. }

  D3DERR_DEVICEAGGREGATED          = $88760000 + 707;

  D3DERR_EXECUTE_CREATE_FAILED     = $88760000 + 710;
  D3DERR_EXECUTE_DESTROY_FAILED    = $88760000 + 711;
  D3DERR_EXECUTE_LOCK_FAILED       = $88760000 + 712;
  D3DERR_EXECUTE_UNLOCK_FAILED     = $88760000 + 713;
  D3DERR_EXECUTE_LOCKED            = $88760000 + 714;
  D3DERR_EXECUTE_NOT_LOCKED        = $88760000 + 715;

  D3DERR_EXECUTE_FAILED            = $88760000 + 716;
  D3DERR_EXECUTE_CLIPPED_FAILED    = $88760000 + 717;

  D3DERR_TEXTURE_NO_SUPPORT        = $88760000 + 720;
  D3DERR_TEXTURE_CREATE_FAILED     = $88760000 + 721;
  D3DERR_TEXTURE_DESTROY_FAILED    = $88760000 + 722;
  D3DERR_TEXTURE_LOCK_FAILED       = $88760000 + 723;
  D3DERR_TEXTURE_UNLOCK_FAILED     = $88760000 + 724;
  D3DERR_TEXTURE_LOAD_FAILED       = $88760000 + 725;
  D3DERR_TEXTURE_SWAP_FAILED       = $88760000 + 726;
  D3DERR_TEXTURE_LOCKED            = $88760000 + 727;
  D3DERR_TEXTURE_NOT_LOCKED        = $88760000 + 728;
  D3DERR_TEXTURE_GETSURF_FAILED    = $88760000 + 729;

  D3DERR_MATRIX_CREATE_FAILED      = $88760000 + 730;
  D3DERR_MATRIX_DESTROY_FAILED     = $88760000 + 731;
  D3DERR_MATRIX_SETDATA_FAILED     = $88760000 + 732;
  D3DERR_MATRIX_GETDATA_FAILED     = $88760000 + 733;
  D3DERR_SETVIEWPORTDATA_FAILED    = $88760000 + 734;

  D3DERR_INVALIDCURRENTVIEWPORT    = $88760000 + 735;
  D3DERR_INVALIDPRIMITIVETYPE      = $88760000 + 736;
  D3DERR_INVALIDVERTEXTYPE         = $88760000 + 737;
  D3DERR_TEXTURE_BADSIZE           = $88760000 + 738;
  D3DERR_INVALIDRAMPTEXTURE        = $88760000 + 739;

  D3DERR_MATERIAL_CREATE_FAILED    = $88760000 + 740;
  D3DERR_MATERIAL_DESTROY_FAILED   = $88760000 + 741;
  D3DERR_MATERIAL_SETDATA_FAILED   = $88760000 + 742;
  D3DERR_MATERIAL_GETDATA_FAILED   = $88760000 + 743;

  D3DERR_INVALIDPALETTE            = $88760000 + 744;

  D3DERR_ZBUFF_NEEDS_SYSTEMMEMORY  = $88760000 + 745;
  D3DERR_ZBUFF_NEEDS_VIDEOMEMORY   = $88760000 + 746;
  D3DERR_SURFACENOTINVIDMEM        = $88760000 + 747;

  D3DERR_LIGHT_SET_FAILED          = $88760000 + 750;
  D3DERR_LIGHTHASVIEWPORT          = $88760000 + 751;
  D3DERR_LIGHTNOTINTHISVIEWPORT    = $88760000 + 752;

  D3DERR_SCENE_IN_SCENE            = $88760000 + 760;
  D3DERR_SCENE_NOT_IN_SCENE        = $88760000 + 761;
  D3DERR_SCENE_BEGIN_FAILED        = $88760000 + 762;
  D3DERR_SCENE_END_FAILED          = $88760000 + 763;

  D3DERR_INBEGIN                   = $88760000 + 770;
  D3DERR_NOTINBEGIN                = $88760000 + 771;
  D3DERR_NOVIEWPORTS               = $88760000 + 772;
  D3DERR_VIEWPORTDATANOTSET        = $88760000 + 773;
  D3DERR_VIEWPORTHASNODEVICE       = $88760000 + 774;
  D3DERR_NOCURRENTVIEWPORT         = $88760000 + 775;

  D3DERR_INVALIDVERTEXFORMAT       = $88760000 + 2048;

  D3DERR_COLORKEYATTACHED          = $88760000 + 2050;

  D3DERR_VERTEXBUFFEROPTIMIZED     = $88760000 + 2060;
  D3DERR_VBUF_CREATE_FAILED        = $88760000 + 2061;
  D3DERR_VERTEXBUFFERLOCKED        = $88760000 + 2062;

  D3DERR_ZBUFFER_NOTPRESENT        = $88760000 + 2070;
  D3DERR_STENCILBUFFER_NOTPRESENT  = $88760000 + 2071;

  D3DERR_WRONGTEXTUREFORMAT        = $88760000 + 2072;
  D3DERR_UNSUPPORTEDCOLOROPERATION = $88760000 + 2073;
  D3DERR_UNSUPPORTEDCOLORARG       = $88760000 + 2074;
  D3DERR_UNSUPPORTEDALPHAOPERATION = $88760000 + 2075;
  D3DERR_UNSUPPORTEDALPHAARG       = $88760000 + 2076;
  D3DERR_TOOMANYOPERATIONS         = $88760000 + 2077;
  D3DERR_CONFLICTINGTEXTUREFILTER  = $88760000 + 2078;
  D3DERR_UNSUPPORTEDFACTORVALUE    = $88760000 + 2079;
  D3DERR_CONFLICTINGRENDERSTATE    = $88760000 + 2081;
  D3DERR_UNSUPPORTEDTEXTUREFILTER  = $88760000 + 2082;
  D3DERR_TOOMANYPRIMITIVES         = $88760000 + 2083;
  D3DERR_INVALIDMATRIX             = $88760000 + 2084;
  D3DERR_TOOMANYVERTICES           = $88760000 + 2085;
  D3DERR_CONFLICTINGTEXTUREPALETTE = $88760000 + 2086;

(*==========================================================================;
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       d3drmdef.h
 *  Content:    Direct3DRM include file
 *
 ***************************************************************************)

{ TD3DRMVector4D structure }

type
  PD3DRMVector4D = ^TD3DRMVector4D;
  TD3DRMVector4D = record
    x, y, z, w: TD3DValue;
  end;

  D3DRMVECTOR4D = TD3DRMVector4D;
  LPD3DRMVECTOR4D = PD3DRMVector4D;

{ TD3DRMMatrix4D structure }

  TD3DRMMatrix4D = array[0..3, 0..3] of TD3DValue;
  D3DRMMATRIX4D = TD3DRMMatrix4D;

{ TD3DRMQuaternion structure }

  PD3DRMQuaternion = ^TD3DRMQuaternion;
  TD3DRMQuaternion = record
    s: TD3DValue;
    v: TD3DVector;
  end;

  D3DRMQUATERNION = TD3DRMQuaternion;
  LPD3DRMQUATERNION = PD3DRMQUATERNION;

{ TD3DRMRay structure }

  PD3DRMRay = ^TD3DRMRay;
  TD3DRMRay = record
    dvDir: TD3DVector;
    dvPos: TD3DVector;
  end;

  D3DRMRAY = TD3DRMRay;
  LPD3DRMRAY = PD3DRMRay;

{ TD3DRMBox structure }

  PD3DRMBox = ^TD3DRMBox;
  TD3DRMBox = record
    min, max: TD3DVector;
  end;

  D3DRMBOX = TD3DRMBox;
  LPD3DRMBOX = PD3DRMBox;

{ TD3DRMWrapCallback }

  TD3DRMWrapCallback = procedure(var lpD3DVector: TD3DVector; var lpU: Integer;
      var lpV: Integer; var lpD3DRMVA: TD3DVector; lpD3DRMVB: TD3DVector;
      lpArg: Pointer); stdcall;

  D3DRMWRAPCALLBACK = TD3DRMWrapCallback;

{  TD3DRMLightType  }

  TD3DRMLightType = (
    D3DRMLIGHT_AMBIENT,
    D3DRMLIGHT_POINT,
    D3DRMLIGHT_SPOT,
    D3DRMLIGHT_DIRECTIONAL,
    D3DRMLIGHT_PARALLELPOINT
  );

  D3DRMLIGHTTYPE = TD3DRMLightType;

{ TD3DRMShadeMode }

  TD3DRMShadeMode = Word;
  D3DRMSHADEMODE = TD3DRMShadeMode;

const
  D3DRMSHADE_FLAT = 0;
  D3DRMSHADE_GOURAUD = 1;
  D3DRMSHADE_PHONG = 2;
  D3DRMSHADE_MASK = 7;
  D3DRMSHADE_MAX = 8;

{ TD3DRMLightMode }

type
  TD3DRMLightMode = Word;
  D3DRMLIGHTMODE = TD3DRMLightMode;

const
  D3DRMLIGHT_OFF  = 0 * D3DRMSHADE_MAX;
  D3DRMLIGHT_ON   = 1 * D3DRMSHADE_MAX;
  D3DRMLIGHT_MASK = 7 * D3DRMSHADE_MAX;
  D3DRMLIGHT_MAX  = 8 * D3DRMSHADE_MAX;

{ TD3DRMFillMode }

type
  TD3DRMFillMode = Word;
  D3DRMFILLMODE = TD3DRMFillMode;

const
  D3DRMFILL_POINTS    = 0 * D3DRMLIGHT_MAX;
  D3DRMFILL_WIREFRAME = 1 * D3DRMLIGHT_MAX;
  D3DRMFILL_SOLID     = 2 * D3DRMLIGHT_MAX;
  D3DRMFILL_MASK      = 7 * D3DRMLIGHT_MAX;
  D3DRMFILL_MAX       = 8 * D3DRMLIGHT_MAX;

{ TD3DRMRenderQuality }

type
  TD3DRMRenderQuality = DWORD;
  D3DRMRENDERQUALITY = TD3DRMRenderQuality;

const
  D3DRMRENDER_WIREFRAME   = D3DRMSHADE_FLAT + D3DRMLIGHT_OFF + D3DRMFILL_WIREFRAME;
  D3DRMRENDER_UNLITFLAT   = D3DRMSHADE_FLAT + D3DRMLIGHT_OFF + D3DRMFILL_SOLID;
  D3DRMRENDER_FLAT        = D3DRMSHADE_FLAT + D3DRMLIGHT_ON + D3DRMFILL_SOLID;
  D3DRMRENDER_GOURAUD     = D3DRMSHADE_GOURAUD + D3DRMLIGHT_ON + D3DRMFILL_SOLID;
  D3DRMRENDER_PHONG       = D3DRMSHADE_PHONG + D3DRMLIGHT_ON + D3DRMFILL_SOLID;

  D3DRMRENDERMODE_BLENDEDTRANSPARENCY      = 1;
  D3DRMRENDERMODE_SORTEDTRANSPARENCY       = 2;
  D3DRMRENDERMODE_LIGHTINMODELSPACE        = 8;
  D3DRMRENDERMODE_VIEWDEPENDENTSPECULAR    = 16;
  D3DRMRENDERMODE_DISABLESORTEDALPHAZWRITE = 32;

{ TD3DRMTextureQuality }

type
  TD3DRMTextureQuality = (
    D3DRMTEXTURE_NEAREST,               // choose nearest texel
    D3DRMTEXTURE_LINEAR,                // interpolate 4 texels
    D3DRMTEXTURE_MIPNEAREST,            // nearest texel in nearest mipmap
    D3DRMTEXTURE_MIPLINEAR,             // interpolate 2 texels from 2 mipmaps
    D3DRMTEXTURE_LINEARMIPNEAREST,      // interpolate 4 texels in nearest mipmap
    D3DRMTEXTURE_LINEARMIPLINEAR        // interpolate 8 texels from 2 mipmaps
  );

  D3DRMTEXTUREQUALITY = TD3DRMTextureQuality;

{ Texture flags }

const
  D3DRMTEXTURE_FORCERESIDENT          = $00000001; // texture should be kept in video memory
  D3DRMTEXTURE_STATIC                 = $00000002; // texture will not change
  D3DRMTEXTURE_DOWNSAMPLEPOINT        = $00000004; // point filtering should be used when downsampling
  D3DRMTEXTURE_DOWNSAMPLEBILINEAR     = $00000008; // bilinear filtering should be used when downsampling
  D3DRMTEXTURE_DOWNSAMPLEREDUCEDEPTH  = $00000010; // reduce bit depth when downsampling
  D3DRMTEXTURE_DOWNSAMPLENONE         = $00000020; // texture should never be downsampled
  D3DRMTEXTURE_CHANGEDPIXELS          = $00000040; // pixels have changed
  D3DRMTEXTURE_CHANGEDPALETTE         = $00000080; // palette has changed
  D3DRMTEXTURE_INVALIDATEONLY         = $00000100; // dirty regions are invalid

{ Shadow flags }

const
  D3DRMSHADOW_TRUEALPHA = $00000001; // shadow should render without artifacts when true alpha is on

{ TD3DRMCombineType }

type
  TD3DRMCombineType = (
     D3DRMCOMBINE_REPLACE,
     D3DRMCOMBINE_BEFORE,
     D3DRMCOMBINE_AFTER
  );

  D3DRMCOMBINETYPE = TD3DRMCombineType;

{ TD3DRMColorModel }

  TD3DRMColorModel = TD3DColorModel;
  D3DRMCOLORMODEL = TD3DRMColorModel;

{ TD3DRMPaletteFlags }

  TD3DRMPaletteFlags = (
    D3DRMPALETTE_FREE,                  // renderer may use this entry freely
    D3DRMPALETTE_READONLY,              // fixed but may be used by renderer
    D3DRMPALETTE_RESERVED               // may not be used by renderer
  );

  D3DRMPALETTEFLAGS = TD3DRMPaletteFlags;

{ TD3DRMPaletteEntry structure }

  PD3DRMPaletteEntry = ^TD3DRMPaletteEntry;
  TD3DRMPaletteEntry = record
    red: Byte;          // 0 .. 255
    green: Byte;        // 0 .. 255
    blue: Byte;         // 0 .. 255
    flags: Byte;        // one of TD3DRMPaletteFlags
  end;

  D3DRMPALETTEENTRY = TD3DRMPaletteEntry;
  LPD3DRMPALETTEENTRY = PD3DRMPaletteEntry;

{ TD3DRMImage structure }

  PD3DRMImage = ^TD3DRMImage;
  TD3DRMImage = record
    width, height: Integer;    (* width and height in pixels *)
    aspectx, aspecty: Integer; (* aspect ratio for non-square pixels *)
    depth: Integer;            (* bits per pixel *)
    rgb: Integer;              (* if false, pixels are indices into a
                                   palette otherwise, pixels encode
                                   RGB values. *)
    bytes_per_line: Integer;   (* number of bytes of memory for a
                                   scanline. This must be a multiple
                                   of 4. *)
    buffer1: Pointer;          (* memory to render into (first buffer). *)
    buffer2: Pointer;          (* second rendering buffer for double
                                   buffering, set to NULL for single
                                   buffering. *)
    red_mask: Longint;
    green_mask: Longint;
    blue_mask: Longint;
    alpha_mask: Longint;       (* if rgb is true, these are masks for
                                   the red, green and blue parts of a
                                   pixel.  Otherwise, these are masks
                                   for the significant bits of the
                                   red, green and blue elements in the
                                   palette.  For instance, most SVGA
                                   displays use 64 intensities of red,
                                   green and blue, so the masks should
                                   all be set to = $fc. *)
    palette_size: Integer;     (* number of entries in palette *)
    palette: PD3DRMPaletteEntry; (* description of the palette (only if
                                   rgb is false).  Must be (1<<depth)
                                   elements. *)
  end;

  D3DRMIMAGE = TD3DRMImage;
  LPD3DRMIMAGE = PD3DRMImage;

{ TD3DRMWrapType }

  TD3DRMWrapType = (
    D3DRMWRAP_FLAT,
    D3DRMWRAP_CYLINDER,
    D3DRMWRAP_SPHERE,
    D3DRMWRAP_CHROME,
    D3DRMWRAP_SHEET,
    D3DRMWRAP_BOX
  );

  D3DRMWRAPTYPE = TD3DRMWrapType;

const
  D3DRMWIREFRAME_CULL             = 1; // cull backfaces
  D3DRMWIREFRAME_HIDDENLINE       = 2; // lines are obscured by closer objects

{ TD3DRMProjectionType }

type
  TD3DRMProjectionType = (
    D3DRMPROJECT_PERSPECTIVE,
    D3DRMPROJECT_ORTHOGRAPHIC,
    D3DRMPROJECT_RIGHTHANDPERSPECTIVE,  // Only valid pre-DX6
    D3DRMPROJECT_RIGHTHANDORTHOGRAPHIC  // Only valid pre-DX6
  );

  D3DRMPROJECTIONTYPE = TD3DRMProjectionType;

const
  D3DRMOPTIONS_LEFTHANDED  = $00000001; // Default
  D3DRMOPTIONS_RIGHTHANDED = $00000002;

{ TD3DRMXOFFormat }

type
  TD3DRMXOFFormat = (
    D3DRMXOF_BINARY,
    D3DRMXOF_COMPRESSED,
    D3DRMXOF_TEXT
  );

  D3DRMXOFFORMAT = TD3DRMXOFFormat;

{ TD3DRMSaveOptions }

  TD3DRMSaveOptions = DWORD;
  D3DRMSAVEOPTIONS = TD3DRMSaveOptions;

const
  D3DRMXOFSAVE_NORMALS = 1;
  D3DRMXOFSAVE_TEXTURECOORDINATES = 2;
  D3DRMXOFSAVE_MATERIALS = 4;
  D3DRMXOFSAVE_TEXTURENAMES = 8;
  D3DRMXOFSAVE_ALL = 15;
  D3DRMXOFSAVE_TEMPLATES = 16;
  D3DRMXOFSAVE_TEXTURETOPOLOGY = 32;

{ TD3DRMColorSource }

type
  TD3DRMColorSource = (
    D3DRMCOLOR_FROMFACE,
    D3DRMCOLOR_FROMVERTEX
  );

  D3DRMCOLORSOURCE = TD3DRMColorSource;

{ TD3DRMFrameConstraint }

  TD3DRMFrameConstraint = (
    D3DRMCONSTRAIN_Z,           // use only X and Y rotations
    D3DRMCONSTRAIN_Y,           // use only X and Z rotations
    D3DRMCONSTRAIN_X            // use only Y and Z rotations
  );

  D3DRMFRAMECONSTRAINT = TD3DRMFrameConstraint;

{ TD3DRMMaterialMode }

  TD3DRMMaterialMode = (
    D3DRMMATERIAL_FROMMESH,
    D3DRMMATERIAL_FROMPARENT,
    D3DRMMATERIAL_FROMFRAME
  );

  D3DRMMATERIALMODE = TD3DRMMaterialMode;

{ TD3DRMFogMode }

  TD3DRMFogMode = (
    D3DRMFOG_LINEAR,            // linear between start and end
    D3DRMFOG_EXPONENTIAL,       // density * exp(-distance)
    D3DRMFOG_EXPONENTIALSQUARED // density * exp(-distance*distance)
  );

  D3DRMFOGMODE = TD3DRMFogMode;

{ TD3DRMZBufferMode }

  TD3DRMZBufferMode = (
    D3DRMZBUFFER_FROMPARENT,    // default
    D3DRMZBUFFER_ENABLE,        // enable zbuffering
    D3DRMZBUFFER_DISABLE        // disable zbuffering
  );

  D3DRMZBUFFERMODE = TD3DRMZBufferMode;

{ TD3DRMSortMode }

  TD3DRMSortMode = (
    D3DRMSORT_FROMPARENT,       // default
    D3DRMSORT_NONE,             // don't sort child frames
    D3DRMSORT_FRONTTOBACK,      // sort child frames front-to-back
    D3DRMSORT_BACKTOFRONT       // sort child frames back-to-front
  );

  D3DRMSORTMODE = TD3DRMSortMode;

{ TD3DRMMaterialOverride structure }

  PD3DRMMaterialOverride = ^TD3DRMMaterialOverride;
  TD3DRMMaterialOverride = record
    dwSize: DWORD;              // Size of this structure
    dwFlags: DWORD;             // Indicate which fields are valid
    dcDiffuse: TD3DColorValue;  // RGBA
    dcAmbient: TD3DColorValue;  // RGB
    dcEmissive: TD3DColorValue; // RGB
    dcSpecular: TD3DColorValue; // RGB
    dvPower: TD3DValue;
    lpD3DRMTex: IUnknown;
  end;

  D3DRMMATERIALOVERRIDE = TD3DRMMaterialOverride;
  LPD3DRMMATERIALOVERRIDE = PD3DRMMaterialOverride;

const
  D3DRMMATERIALOVERRIDE_DIFFUSE_ALPHAONLY     = $00000001;
  D3DRMMATERIALOVERRIDE_DIFFUSE_RGBONLY       = $00000002;
  D3DRMMATERIALOVERRIDE_DIFFUSE               = $00000003;
  D3DRMMATERIALOVERRIDE_AMBIENT               = $00000004;
  D3DRMMATERIALOVERRIDE_EMISSIVE              = $00000008;
  D3DRMMATERIALOVERRIDE_SPECULAR              = $00000010;
  D3DRMMATERIALOVERRIDE_POWER                 = $00000020;
  D3DRMMATERIALOVERRIDE_TEXTURE               = $00000040;
  D3DRMMATERIALOVERRIDE_DIFFUSE_ALPHAMULTIPLY = $00000080;
  D3DRMMATERIALOVERRIDE_ALL                   = $000000FF;

  D3DRMFPTF_ALPHA         = $00000001;
  D3DRMFPTF_NOALPHA       = $00000002;
  D3DRMFPTF_PALETTIZED    = $00000004;
  D3DRMFPTF_NOTPALETTIZED = $00000008;

  D3DRMSTATECHANGE_UPDATEONLY  = $000000001;
  D3DRMSTATECHANGE_VOLATILE    = $000000002;
  D3DRMSTATECHANGE_NONVOLATILE = $000000004;
  D3DRMSTATECHANGE_RENDER      = $000000020;
  D3DRMSTATECHANGE_LIGHT       = $000000040;

{ Values for flags in RM3::CreateDeviceFromSurface }

  D3DRMDEVICE_NOZBUFFER = $00000001;

{ Values for flags in Object2::SetClientData }

  D3DRMCLIENTDATA_NONE      = $00000001;
  D3DRMCLIENTDATA_LOCALFREE = $00000002;
  D3DRMCLIENTDATA_IUNKNOWN  = $00000004;

{ Values for flags in Frame2::AddMoveCallback. }

  D3DRMCALLBACK_PREORDER  = 0;
  D3DRMCALLBACK_POSTORDER = 1;

{ Values for flags in MeshBuilder2::RayPick. }

  D3DRMRAYPICK_ONLYBOUNDINGBOXES       = 1;
  D3DRMRAYPICK_IGNOREFURTHERPRIMITIVES = 2;
  D3DRMRAYPICK_INTERPOLATEUV           = 4;
  D3DRMRAYPICK_INTERPOLATECOLOR        = 8;
  D3DRMRAYPICK_INTERPOLATENORMAL       = $10;

{ Values for flags in MeshBuilder3::AddFacesIndexed. }

  D3DRMADDFACES_VERTICESONLY = 1;


{ Values for flags in MeshBuilder2::GenerateNormals. }

  D3DRMGENERATENORMALS_PRECOMPACT     = 1;
  D3DRMGENERATENORMALS_USECREASEANGLE = 2;

{ Values for MeshBuilder3::GetParentMesh }

  D3DRMMESHBUILDER_DIRECTPARENT = 1;
  D3DRMMESHBUILDER_ROOTMESH     = 2;

{ Flags for MeshBuilder3::Enable }
  D3DRMMESHBUILDER_RENDERENABLE = $00000001;
  D3DRMMESHBUILDER_PICKENABLE   = $00000002;

{ Flags for MeshBuilder3::AddMeshBuilder }
  D3DRMADDMESHBUILDER_DONTCOPYAPPDATA  = 1;
  D3DRMADDMESHBUILDER_FLATTENSUBMESHES = 2;
  D3DRMADDMESHBUILDER_NOSUBMESHES      = 4;

{ Flags for Object2::GetAge when used with MeshBuilders }
  D3DRMMESHBUILDERAGE_GEOMETRY  = $00000001;
  D3DRMMESHBUILDERAGE_MATERIALS = $00000002;
  D3DRMMESHBUILDERAGE_TEXTURES  = $00000004;

{ Format flags for MeshBuilder3::AddTriangles. }

  D3DRMFVF_TYPE          = $00000001;
  D3DRMFVF_NORMAL        = $00000002;
  D3DRMFVF_COLOR         = $00000004;
  D3DRMFVF_TEXTURECOORDS = $00000008;

  D3DRMVERTEX_STRIP = $00000001;
  D3DRMVERTEX_FAN   = $00000002;
  D3DRMVERTEX_LIST  = $00000004;

{ Values for flags in Viewport2::Clear2 }

  D3DRMCLEAR_TARGET     = $00000001;
  D3DRMCLEAR_ZBUFFER    = $00000002;
  D3DRMCLEAR_DIRTYRECTS = $00000004;
  D3DRMCLEAR_ALL        = D3DRMCLEAR_TARGET or D3DRMCLEAR_ZBUFFER or D3DRMCLEAR_DIRTYRECTS;

{ Values for flags in Frame3::SetSceneFogMethod }

  D3DRMFOGMETHOD_VERTEX = $00000001;
  D3DRMFOGMETHOD_TABLE  = $00000002;
  D3DRMFOGMETHOD_ANY    = $00000004;

{ Values for flags in Frame3::SetTraversalOptions }

  D3DRMFRAME_RENDERENABLE = $00000001;
  D3DRMFRAME_PICKENABLE   = $00000002;

{ TD3DRMAnimationOptions }

type
  TD3DRMAnimationOptions = DWORD;
  D3DRMANIMATIONOPTIONS = TD3DRMAnimationOptions;

const
  D3DRMANIMATION_OPEN             = $01;
  D3DRMANIMATION_CLOSED           = $02;
  D3DRMANIMATION_LINEARPOSITION   = $04;
  D3DRMANIMATION_SPLINEPOSITION   = $08;
  D3DRMANIMATION_SCALEANDROTATION = $00000010;
  D3DRMANIMATION_POSITION         = $00000020;

{ TD3DRMInterpolationOptions }

type
  TD3DRMInterpolationOptions = DWORD;
  D3DRMINTERPOLATIONOPTIONS = TD3DRMInterpolationOptions;

const
  D3DRMINTERPOLATION_OPEN         = $01;
  D3DRMINTERPOLATION_CLOSED       = $02;
  D3DRMINTERPOLATION_NEAREST      = $0100;
  D3DRMINTERPOLATION_LINEAR       = $04;
  D3DRMINTERPOLATION_SPLINE       = $08;
  D3DRMINTERPOLATION_VERTEXCOLOR  = $40;
  D3DRMINTERPOLATION_SLERPNORMALS = $80;

{ TD3DRMLoadOptions }

type
  TD3DRMLoadOptions = DWORD;
  D3DRMLOADOPTIONS = TD3DRMLoadOptions;

const
  D3DRMLOAD_FROMFILE  = $00;
  D3DRMLOAD_FROMRESOURCE = $01;
  D3DRMLOAD_FROMMEMORY = $02;
  D3DRMLOAD_FROMSTREAM = $04;
  D3DRMLOAD_FROMURL = $08;

  D3DRMLOAD_BYNAME = $10;
  D3DRMLOAD_BYPOSITION = $20;
  D3DRMLOAD_BYGUID = $40;
  D3DRMLOAD_FIRST = $80;

  D3DRMLOAD_INSTANCEBYREFERENCE = $100;
  D3DRMLOAD_INSTANCEBYCOPYING = $200;

  D3DRMLOAD_ASYNCHRONOUS = $400;

{ TD3DRMLoadReource }

type
  PD3DRMLoadReource = ^TD3DRMLoadReource;
  TD3DRMLoadReource = record
    hModule: HMODULE;
    lpName: PChar;
    lpType: PChar;
  end;

  D3DRMLOADRESOURCE = TD3DRMLoadReource;
  LPD3DRMLOADRESOURCE = PD3DRMLoadReource;

{ TD3DRMLoadMemory }

  PD3DRMLoadMemory = ^TD3DRMLoadMemory;
  TD3DRMLoadMemory = record
    lpMemory: Pointer;
    dSize: DWORD;
  end;

  D3DRMLOADMEMORY = TD3DRMLoadMemory;
  LPD3DRMLOADMEMORY = PD3DRMLoadMemory;

const
  D3DRMPMESHSTATUS_VALID            = $01;
  D3DRMPMESHSTATUS_INTERRUPTED      = $02;
  D3DRMPMESHSTATUS_BASEMESHCOMPLETE = $04;
  D3DRMPMESHSTATUS_COMPLETE         = $08;
  D3DRMPMESHSTATUS_RENDERABLE       = $10;

  D3DRMPMESHEVENT_BASEMESH = $01;
  D3DRMPMESHEVENT_COMPLETE = $02;

{ TD3DRMPMeshLoadStatus }

type
  PD3DRMPMeshLoadStatus = ^TD3DRMPMeshLoadStatus;
  TD3DRMPMeshLoadStatus = record
    dwSize: DWORD;           // Size of this structure
    dwPMeshSize: DWORD;      // Total Size (bytes)
    dwBaseMeshSize: DWORD;   // Total Size of the Base Mesh
    dwBytesLoaded: DWORD;    // Total bytes loaded
    dwVerticesLoaded: DWORD; // Number of vertices loaded
    dwFacesLoaded: DWORD;    // Number of faces loaded
    dwLoadResult: HResult;   // Result of the load operation
    dwFlags: DWORD;
  end;

  D3DRMPMESHLOADSTATUS = TD3DRMPMeshLoadStatus;
  LPD3DRMPMESHLOADSTATUS = PD3DRMPMeshLoadStatus;

{ TD3DRMUserVisualReason }

  TD3DRMUserVisualReason = (
    D3DRMUSERVISUAL_CANSEE,
    D3DRMUSERVISUAL_RENDER
  );

  D3DRMUSERVISUALREASON = TD3DRMUserVisualReason;

{ TD3DRMAnimationKey }

  PD3DRMAnimationKey = ^TD3DRMAnimationKey;
  TD3DRMAnimationKey = record
    dwSize: DWORD;
    dwKeyType: DWORD;
    dvTime: TD3DValue;
    dwID: DWORD;

    case Integer of
      0: (dqRotateKey: TD3DRMQuaternion);
      1: (dvScaleKey: TD3DValue);
      2: (dvPositionKey: TD3DValue);
      3: (dvK: array[0..3] of TD3DValue);
    end;

  D3DRMANIMATIONKEY = TD3DRMAnimationKey;
  LPD3DRMANIMATIONKEY = PD3DRMAnimationKey;

procedure D3DRMAnimationGetRotateKey(const rmKey: TD3DRMAnimationKey; var rmQuat: TD3DRMQuaternion);
procedure D3DRMAnimationGetScaleKey(const rmKey: TD3DRMAnimationKey; var dvVec: TD3DVector);
procedure D3DRMAnimationGetPositionKey(const rmKey: TD3DRMAnimationKey; var dvVec: TD3DVector);
procedure D3DRMAnimationSetRotateKey(var rmKey: TD3DRMAnimationKey; const rmQuat: TD3DRMQuaternion);
procedure D3DRMAnimationSetScaleKey(var rmKey: TD3DRMAnimationKey; const dvVec: TD3DVector);
procedure D3DRMAnimationSetPositionKey(var rmKey: TD3DRMAnimationKey; const dvVec: TD3DVector);

const
  D3DRMANIMATION_ROTATEKEY   = $01;
  D3DRMANIMATION_SCALEKEY    = $02;
  D3DRMANIMATION_POSITIONKEY = $03;

{ TD3DRMMapping }

type
  TD3DRMMapping = DWORD;
  D3DRMMAPPING = TD3DRMMapping;

{ TD3DRMMappingFlag }

  TD3DRMMappingFlag = DWORD;
  D3DRMMAPPINGFLAG = TD3DRMMappingFlag;

const
  D3DRMMAP_WRAPU        = 1;
  D3DRMMAP_WRAPV        = 2;
  D3DRMMAP_PERSPCORRECT = 4;

{ TD3DRMVertex }

type
  PD3DRMVertex = ^TD3DRMVertex;
  TD3DRMVertex = record
    position: TD3DVector;
    normal: TD3DVector;
    tu, tv: TD3DValue;
    color: TD3DColor;
  end;

  D3DRMVERTEX = TD3DRMVertex;
  LPD3DRMVERTEX = PD3DRMVertex;

{ TD3DRMGroupIndex }

  TD3DRMGroupIndex = Longint;
  D3DRMGROUPINDEX = TD3DRMGroupIndex; // group indexes begin a 0

const
  D3DRMGROUP_ALLGROUPS = -1;

{ Create a color from three components in the range 0-1 inclusive. }
function D3DRMCreateColorRGB(red, green, blue: TD3DValue): TD3DColor; stdcall;

{ Create a color from four components in the range 0-1 inclusive. }
function D3DRMCreateColorRGBA(red, green, blue, alpha: TD3DValue): TD3DColor; stdcall;

{ Get the red component of a color. }
function D3DRMColorGetRed(d3drmc: TD3DColor): TD3DValue; stdcall;

{ Get the green component of a color. }
function D3DRMColorGetGreen(d3drmc: TD3DColor): TD3DValue; stdcall;

{ Get the blue component of a color. }
function D3DRMColorGetBlue(d3drmc: TD3DColor): TD3DValue; stdcall;

{ Get the alpha component of a color. }
function D3DRMColorGetAlpha(d3drmc: TD3DColor): TD3DValue; stdcall;

{ Add two vectors.  Returns its first argument. }
function D3DRMVectorAdd(var d, s1, s2: TD3DVector): PD3DVector; stdcall;

{ Subtract two vectors.  Returns its first argument. }
function D3DRMVectorSubtract(var d, s1, s2: TD3DVector): PD3DVector; stdcall;

{ Reflect a ray about a given normal.  Returns its first argument. }
function D3DRMVectorReflect(var d, ray, norm: TD3DVector): PD3DVector; stdcall;

{ Calculate the vector cross product.  Returns its first argument. }
function D3DRMVectorCrossProduct(var d, s1, s2: TD3DVector): PD3DVector; stdcall;

{ Return the vector dot product. }
function D3DRMVectorDotProduct(var s1, s2: TD3DVector): TD3DValue; stdcall;

{ Scale a vector so that its modulus is 1.  Returns its argument or
  NULL if there was an error (e.g. a zero vector was passed). }
function D3DRMVectorNormalize(var lpv: TD3DVector): PD3DVector; stdcall;

{ Return the length of a vector (e.g. sqrt(x*x + y*y + z*z)). }
function D3DRMVectorModulus(var v: TD3DVector): TD3DValue; stdcall;

{ Set the rotation part of a matrix to be a rotation of theta radians
  around the given axis. }
function D3DRMVectorRotate(var r, v, axis: TD3DVector; theta: TD3DValue): PD3DVector; stdcall;

{ Scale a vector uniformly in all three axes }
function D3DRMVectorScale( var d, s: TD3DVector; factor: TD3DValue): PD3DVector; stdcall;

{ Return a random unit vector }
function D3DRMVectorRandom(var d: TD3DVector): PD3DVector; stdcall;

{ Returns a unit quaternion that represents a rotation of theta radians
  around the given axis. }
function D3DRMQuaternionFromRotation(var quat: PD3DRMQuaternion;
    var v: TD3DVector; theta: TD3DValue): PD3DRMQuaternion; stdcall;

{ Calculate the product of two quaternions }
function D3DRMQuaternionMultiply(var q, a, b: TD3DRMQuaternion): PD3DRMQuaternion; stdcall;

{ Interpolate between two quaternions }
function D3DRMQuaternionSlerp(var q, a, b: TD3DRMQuaternion; alpha: TD3DValue): PD3DRMQuaternion; stdcall;

{ Calculate the matrix for the rotation that a unit quaternion represents }
procedure D3DRMMatrixFromQuaternion(dmMat: TD3DRMMatrix4D; var lpDqQuat: TD3DRMQuaternion); stdcall;

{ Calculate the quaternion that corresponds to a rotation matrix }
function D3DRMQuaternionFromMatrix(var lpQuat: TD3DRMQuaternion; Mat: TD3DRMMatrix4D): PD3DRMQuaternion;

(*==========================================================================;
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       d3drm.h, d3drmobj.h, d3drmwin.h
 *  Content:    Direct3DRM include file
 *
 ***************************************************************************)

{ Direct3DRM Object classes }
const
  CLSID_CDirect3DRMDevice: TGUID = '{4FA3568E-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMViewport: TGUID = '{4FA3568F-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMFrame: TGUID = '{4FA35690-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMMesh: TGUID = '{4FA35691-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMMeshBuilder: TGUID = '{4FA35692-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMFace: TGUID = '{4FA35693-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMLight: TGUID = '{4FA35694-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMTexture: TGUID = '{4FA35695-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMWrap: TGUID = '{4FA35696-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMMaterial: TGUID = '{4FA35697-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMAnimation: TGUID = '{4FA35698-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMAnimationSet: TGUID = '{4FA35699-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMUserVisual: TGUID = '{4FA3569A-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMShadow: TGUID = '{4FA3569B-623F-11CF-AC4A-0000C03825A1}';
  CLSID_CDirect3DRMViewportInterpolator: TGUID = '{0DE9EAA1-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMFrameInterpolator: TGUID = '{0DE9EAA2-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMMeshInterpolator: TGUID = '{0DE9EAA3-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMLightInterpolator: TGUID = '{0DE9EAA6-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMMaterialInterpolator: TGUID = '{0DE9EAA7-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMTextureInterpolator: TGUID = '{0DE9EAA8-3B84-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMProgressiveMesh: TGUID = '{4516EC40-8F20-11D0-9B6D-0000C0781BC3}';
  CLSID_CDirect3DRMClippedVisual: TGUID = '{5434E72D-6D66-11D1-BB0B-0000F875865A}';

{ Direct3DRM Object interfaces }

  IID_IDirect3DRMObject: TGUID = '{EB16CB00-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMObject2: TGUID = '{4516EC7C-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMDevice: TGUID = '{E9E19280-6E05-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRMDevice2: TGUID = '{4516EC78-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMDevice3: TGUID = '{549F498B-BFEB-11D1-8ED8-00A0C967A482}';
  IID_IDirect3DRMViewport: TGUID = '{EB16CB02-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMViewport2: TGUID = '{4A1B1BE6-BFED-11D1-8ED8-00A0C967A482}';
  IID_IDirect3DRMFrame: TGUID = '{EB16CB03-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMFrame2: TGUID = '{C3DFBD60-3988-11D0-9EC2-0000C0291AC3}';
  IID_IDirect3DRMFrame3: TGUID = '{FF6B7F70-A40E-11D1-91F9-0000F8758E66}';
  IID_IDirect3DRMVisual: TGUID = '{EB16CB04-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMMesh: TGUID = '{A3A80D01-6E12-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRMMeshBuilder: TGUID = '{A3A80D02-6E12-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRMMeshBuilder2: TGUID = '{4516EC77-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMMeshBuilder3: TGUID = '{4516EC82-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMFace: TGUID = '{EB16CB07-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMFace2: TGUID = '{4516EC81-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMLight: TGUID = '{EB16CB08-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMTexture: TGUID = '{EB16CB09-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMTexture2: TGUID = '{120F30C0-1629-11D0-941C-0080C80CFA7B}';
  IID_IDirect3DRMTexture3: TGUID = '{FF6B7F73-A40E-11D1-91F9-0000F8758E66}';
  IID_IDirect3DRMWrap: TGUID = '{EB16CB0A-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMMaterial: TGUID = '{EB16CB0B-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMMaterial2: TGUID = '{FF6B7F75-A40E-11D1-91F9-0000F8758E66}';
  IID_IDirect3DRMAnimation: TGUID = '{EB16CB0D-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMAnimation2: TGUID = '{FF6B7F77-A40E-11D1-91F9-0000F8758E66}';
  IID_IDirect3DRMAnimationSet: TGUID = '{EB16CB0E-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMAnimationSet2: TGUID = '{FF6B7F79-A40E-11D1-91F9-0000F8758E66}';
  IID_IDirect3DRMObjectArray: TGUID = '{242F6BC2-3849-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMDeviceArray: TGUID = '{EB16CB10-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMViewportArray: TGUID = '{EB16CB11-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMFrameArray: TGUID = '{EB16CB12-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMVisualArray: TGUID = '{EB16CB13-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMLightArray: TGUID = '{EB16CB14-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMPickedArray: TGUID = '{EB16CB16-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMFaceArray: TGUID = '{EB16CB17-D271-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRMAnimationArray: TGUID = '{D5F1CAE0-4BD7-11D1-B974-0060083E45F3}';
  IID_IDirect3DRMUserVisual: TGUID = '{59163DE0-6D43-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRMShadow: TGUID = '{AF359780-6BA3-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRMShadow2: TGUID = '{86B44E25-9C82-11D1-BB0B-00A0C981A0A6}';
  IID_IDirect3DRMInterpolator: TGUID = '{242F6BC1-3849-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMProgressiveMesh: TGUID = '{4516EC79-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMPicked2Array: TGUID = '{4516EC7B-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRMClippedVisual: TGUID = '{5434E733-6D66-11D1-BB0B-0000F875865A}';

  IID_IDirect3DRMWinDevice: TGUID = '{C5016CC0-D273-11CE-AC48-0000C03825A1}';
  IID_IDirect3DRM: TGUID = '{2BC49361-8327-11CF-AC4A-0000C03825A1}';
  IID_IDirect3DRM2: TGUID = '{4516ECC8-8F20-11D0-9B6D-0000C0781BC3}';
  IID_IDirect3DRM3: TGUID = '{4516EC83-8F20-11D0-9B6D-0000C0781BC3}';

type
  IDirect3DRMObject = interface;
  IDirect3DRMObject2 = interface;
  IDirect3DRMDevice = interface;
  IDirect3DRMDevice2 = interface;
  IDirect3DRMDevice3 = interface;
  IDirect3DRMViewport = interface;
  IDirect3DRMViewport2 = interface;
  IDirect3DRMFrame = interface;
  IDirect3DRMFrame2 = interface;
  IDirect3DRMFrame3 = interface;
  IDirect3DRMVisual = interface;
  IDirect3DRMMesh = interface;
  IDirect3DRMMeshBuilder = interface;
  IDirect3DRMMeshBuilder2 = interface;
  IDirect3DRMMeshBuilder3 = interface;
  IDirect3DRMFace = interface;
  IDirect3DRMFace2 = interface;
  IDirect3DRMLight = interface;
  IDirect3DRMTexture = interface;
  IDirect3DRMTexture2 = interface;
  IDirect3DRMTexture3 = interface;
  IDirect3DRMWrap = interface;
  IDirect3DRMMaterial = interface;
  IDirect3DRMMaterial2 = interface;
  IDirect3DRMInterpolator = interface;
  IDirect3DRMAnimation = interface;
  IDirect3DRMAnimation2 = interface;
  IDirect3DRMAnimationSet = interface;
  IDirect3DRMAnimationSet2 = interface;
  IDirect3DRMUserVisual = interface;
  IDirect3DRMShadow = interface;
  IDirect3DRMShadow2 = interface;
  IDirect3DRMArray= interface;
  IDirect3DRMObjectArray = interface;
  IDirect3DRMDeviceArray = interface;
  IDirect3DRMFaceArray = interface;
  IDirect3DRMViewportArray = interface;
  IDirect3DRMFrameArray = interface;
  IDirect3DRMAnimationArray = interface;
  IDirect3DRMVisualArray = interface;
  IDirect3DRMPickedArray = interface;
  IDirect3DRMPicked2Array = interface;
  IDirect3DRMLightArray = interface;
  IDirect3DRMProgressiveMesh = interface;
  IDirect3DRMClippedVisual = interface;

  IDirect3DRMWinDevice = interface;
  IDirect3DRM = interface;
  IDirect3DRM2 = interface;
  IDirect3DRM3 = interface;

  TD3DRMObjectCallback = procedure(obj: IDirect3DRMObject; arg: Pointer); cdecl;
  D3DRMOBJECTCALLBACK = TD3DRMObjectCallback;

  TD3DRMFrameMoveCallback = procedure(obj: IDirect3DRMFrame; arg: Pointer; delta: TD3DValue); cdecl;
  D3DRMFRAMEMOVECALLBACK = TD3DRMFrameMoveCallback;

  TD3DRMFrame3MoveCallback = procedure(obj: IDirect3DRMFrame3; arg: Pointer; delta: TD3DValue); cdecl;
  D3DRMFRAME3MOVECALLBACK = TD3DRMFrame3MoveCallback;

  TD3DRMUpdateCallback = procedure(obj: IDirect3DRMDevice; arg: Pointer;
      iRectCount: DWORD; d3dRectUpdate: PD3DRect); cdecl;
  D3DRMUPDATECALLBACK = TD3DRMUpdateCallback;

  TD3DRMDevice3UpdateCallback = procedure(obj: IDirect3DRMDevice3; arg: Pointer;
      iRectCount: DWORD; d3dRectUpdate: PD3DRect); cdecl;
  D3DRMDEVICE3UPDATECALLBACK = TD3DRMDevice3UpdateCallback;

  TD3DRMUserVisualCallback = function(lpD3DRMUV: IDirect3DRMUserVisual;
      lpArg: Pointer; lpD3DRMUVreason: TD3DRMUserVisualReason;
      lpD3DRMDev: IDirect3DRMDevice;
      lpD3DRMview: IDirect3DRMViewport): Longint; cdecl;
  D3DRMUSERVISUALCALLBACK = TD3DRMUserVisualCallback;

  TD3DRMLoadTextureCallback = function(tex_name: PChar; arg: Pointer;
    out lpD3DRMTex: IDirect3DRMTexture): HResult; cdecl;
  D3DRMLOADTEXTURECALLBACK = TD3DRMLoadTextureCallback;

  TD3DRMLoadTexture3Callback = function(tex_name: PChar; arg: Pointer;
    out lpD3DRMTex: IDirect3DRMTexture3): HResult; cdecl;
  D3DRMLOADTEXTURE3CALLBACK = TD3DRMLoadTexture3Callback;

  TD3DRMLoadCallback = procedure(lpObject: IDirect3DRMObject; const ObjectGuid: TGUID;
     lpArg: Pointer); cdecl;
  D3DRMLOADCALLBACK = TD3DRMLoadCallback;

  TD3DRMDownSampleCallback = function(lpDirect3DRMTexture: IDirect3DRMTexture3;
    pArg: Pointer; pDDSSrc, pDDSDst: IDirectDrawSurface): HResult; cdecl;
  D3DRMDOWNSAMPLECALLBACK = TD3DRMDownSampleCallback;

  TD3DRMValidationCallback = function(lpDirect3DRMTexture: IDirect3DRMTexture3;
    pArg: Pointer; dwFlags: DWORD; dwcRects: DWORD; pRects: PRect): HResult; cdecl;
  D3DRMVALIDATIONCALLBACK = TD3DRMValidationCallback;

{ TD3DRMPickDesc }

  PD3DRMPickDesc = ^TD3DRMPickDesc;
  TD3DRMPickDesc = record
    ulFaceIdx: Longint;
    lGroupIdx: Longint;
    vPosition: TD3DVector;
  end;

  D3DRMPICKDESC = TD3DRMPickDesc;
  LPD3DRMPICKDESC = PD3DRMPickDesc;

{ TD3DRMPickDesc2 }

  PD3DRMPickDesc2 = ^TD3DRMPickDesc2;
  TD3DRMPickDesc2 = record
    ulFaceIdx: Longint;
    lGroupIdx: Longint;
    dvPosition: TD3DVector;
    tu, tv: TD3DValue;
    dvNormal: TD3DVector;
    dcColor: TD3DColor;
  end;

  D3DRMPICKDESC2 = TD3DRMPickDesc2;
  LPD3DRMPICKDESC2 = PD3DRMPickDesc2;

  IDirect3DRMObject = interface(IUnknown)
    ['{EB16CB00-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMObject methods
    function Clone(pUnkOuter: IUnknown; const riid: TGUID; out ppvObj): HResult; stdcall;
    function AddDestroyCallback(lpCallback: TD3DRMObjectCallback;
        lpArg: Pointer): HResult; stdcall;
    function DeleteDestroyCallback(d3drmObjProc: TD3DRMObjectCallback;
        lpArg: Pointer): HResult; stdcall;
    function SetAppData(ulData: DWORD): HResult; stdcall;
    function GetAppData: DWORD; stdcall;
    function SetName(lpName: PChar): HResult; stdcall;
    function GetName(var lpdwSize: DWORD; lpName: PChar): HResult; stdcall;
    function GetClassName(var lpdwSize: DWORD; lpName: PChar): HResult; stdcall;
  end;

  IDirect3DRMObject2 = interface(IUnknown)
    ['{EB16CB00-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMObject2 methods
    function AddDestroyCallback(lpCallback: TD3DRMObjectCallback; lpArg: Pointer): HResult; stdcall;
    function Clone(pUnkOuter: IUnknown; const riid: TGUID;
        out ppvObj): HResult; stdcall;
    function DeleteDestroyCallback(d3drmObjProc: TD3DRMObjectCallback;
        lpArg: Pointer): HResult; stdcall;
    function GetClientData(dwID: DWORD; var lplpvData: Pointer): HResult; stdcall;
    function GetDirect3DRM(out lplpDirect3DRM: IDirect3DRM): HResult; stdcall;
    function GetName(var lpdwSize: DWORD; lpName: LPSTR): HResult; stdcall;
    function SetClientData(dwID: DWORD; lplpvData: Pointer; dwFlags: DWORD): HResult; stdcall;
    function SetName(lpName: PChar): HResult; stdcall;
    function GetAge(dwFlags: DWORD; var pdwAge: DWORD): HResult; stdcall;
  end;

  IDirect3DRMVisual = interface(IDirect3DRMObject)
    ['{EB16CB04-D271-11CE-AC48-0000C03825A1}']
  end;

  IDirect3DRMDevice = interface(IDirect3DRMObject)
    ['{E9E19280-6E05-11CF-AC4A-0000C03825A1}']
    // IDirect3DRMDevice methods
    function Init(width, height: DWORD): HResult; stdcall;
    function InitFromD3D(lpD3D: IDirect3D; lpD3DIMDev: IDirect3DDevice): HResult; stdcall;
    function InitFromClipper(lpDDClipper: IDirectDrawClipper;
        const lpGUID: TGUID; width, height: DWORD): HResult; stdcall;
    function Update: HResult; stdcall;
    function AddUpdateCallback(d3drmUpdateProc: TD3DRMUpdateCallback;
        arg: Pointer): HResult; stdcall;
    function DeleteUpdateCallback(d3drmUpdateProc: TD3DRMUpdateCallback;
        arg: Pointer): HResult; stdcall;
    function SetBufferCount(dwCount: DWORD): HResult; stdcall;
    function GetBufferCount: DWORD; stdcall;
    function SetDither(bDither: BOOL): HResult; stdcall;
    function SetShades(ulShades: DWORD): HResult; stdcall;
    function SetQuality(rqQuality: TD3DRMRenderQuality): HResult; stdcall;
    function SetTextureQuality(tqTextureQuality: TD3DRMTextureQuality): HResult; stdcall;
    function GetViewports(out lplpViewports: IDirect3DRMViewportArray): HResult; stdcall;
    function GetDither: BOOL; stdcall;
    function GetShades: DWORD; stdcall;
    function GetHeight: DWORD; stdcall;
    function GetWidth: DWORD; stdcall;
    function GetTrianglesDrawn: DWORD; stdcall;
    function GetWireframeOptions: DWORD; stdcall;
    function GetQuality: TD3DRMRenderQuality; stdcall;
    function GetColorModel: TD3DColorModel; stdcall;
    function GetTextureQuality: TD3DRMTextureQuality; stdcall;
    function GetDirect3DDevice(out lplpD3DDevice: IDirect3DDevice): HResult; stdcall;
  end;

  IDirect3DRMDevice2 = interface(IDirect3DRMDevice)
    ['{4516EC78-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMDevice2 methods
    function InitFromD3D2(lpD3D: IDirect3D2; lpD3DIMDev: IDirect3DDevice2): HResult; stdcall;
    function InitFromSurface(const lpGUID: TGUID; lpDD: IDirectDraw;
        lpDDSBack: IDirectDrawSurface): HResult; stdcall;
    function SetRenderMode(dwFlags: DWORD): HResult; stdcall;
    function GetRenderMode: DWORD; stdcall;
    function GetDirect3DDevice2(out lplpD3DDevice: IDirect3DDevice2): HResult; stdcall;
  end;

  IDirect3DRMDevice3 = interface(IDirect3DRMDevice2)
    ['{549F498B-BFEB-11D1-8ED8-00A0C967A482}']
    // IDirect3DRMDevice3 methods
    function FindPreferredTextureFormat(dwBitDepths: DWORD; dwFlags: DWORD;
        var lpDDPF: TDDPixelFormat): HResult; stdcall;
    function RenderStateChange(drsType: TD3DRenderStateType; dwVal: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function LightStateChange(drsType: TD3DLightStateType; dwVal: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function GetStateChangeOptions(dwStateClass: DWORD; dwStateNum: DWORD;
        var pdwFlags: DWORD): HResult; stdcall;
    function SetStateChangeOptions(dwStateClass: DWORD; dwStateNum: DWORD;
        dwFlags: DWORD): HResult; stdcall;
  end;

  IDirect3DRMViewport = interface(IDirect3DRMObject)
    ['{EB16CB02-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMViewport methods
    function Init(lpD3DRMDevice: IDirect3DRMDevice;
        lpD3DRMFrameCamera: IDirect3DRMFrame; xpos, ypos, width, height: DWORD): HResult; stdcall;
    function Clear: HResult; stdcall;
    function Render(lpD3DRMFrame: IDirect3DRMFrame): HResult; stdcall;
    function SetFront(rvFront: TD3DValue): HResult; stdcall;
    function SetBack(rvBack: TD3DValue): HResult; stdcall;
    function SetField(rvField: TD3DValue): HResult; stdcall;
    function SetUniformScaling(bScale: BOOL): HResult; stdcall;
    function SetCamera(lpCamera: IDirect3DRMFrame): HResult; stdcall;
    function SetProjection(rptType: TD3DRMProjectionType): HResult; stdcall;
    function Transform(var lprvDst: TD3DRMVector4D; const lprvSrc: TD3DVector): HResult; stdcall;
    function InverseTransform(var lprvDst: TD3DVector;
        var lprvSrc: TD3DRMVector4D): HResult; stdcall;
    function Configure(lX, lY: Longint; dwWidth, dwHeight: DWORD): HResult; stdcall;
    function ForceUpdate(dwX1, dwY1, dwX2, dwY2: DWORD): HResult; stdcall;
    function SetPlane(rvLeft, rvRight, rvBottom, rvTop: TD3DValue): HResult; stdcall;
    function GetCamera(out lpCamera: IDirect3DRMFrame): HResult; stdcall;
    function GetDevice(out lpD3DRMDevice: IDirect3DRMDevice): HResult;  stdcall;
    function GetPlane(var lpd3dvLeft, lpd3dvRight, lpd3dvBottom,
        lpd3dvTop: TD3DValue): HResult; stdcall;
    function Pick(lX, lY: Longint; out lplpVisuals: IDirect3DRMPickedArray): HResult; stdcall;
    function GetUniformScaling: BOOL; stdcall;
    function GetX: Longint; stdcall;
    function GetY: Longint; stdcall;
    function GetWidth: DWORD; stdcall;
    function GetHeight: DWORD; stdcall;
    function GetField: TD3DValue; stdcall;
    function GetBack: TD3DValue; stdcall;
    function GetFront: TD3DValue; stdcall;
    function GetProjection: TD3DRMProjectionType; stdcall;
    function GetDirect3DViewport(out lplpD3DViewport: IDirect3DViewport): HResult; stdcall;
  end;

  IDirect3DRMViewport2 = interface(IDirect3DRMObject)
    ['{4A1B1BE6-BFED-11D1-8ED8-00A0C967A482}']
    // IDirect3DRMViewport2 methods
    function Init(dec: IDirect3DRMDevice3; camera: IDirect3DRMFrame3;
        xpos, ypos: DWORD; width, height: DWORD): HResult; stdcall;
    function Clear(dwFlags: DWORD): HResult; stdcall;
    function Render(lpD3DRMFrame: IDirect3DRMFrame3): HResult; stdcall;
    function SetFront(rvFront: TD3DValue): HResult; stdcall;
    function SetBack(rvBack: TD3DValue): HResult; stdcall;
    function SetField(rvField: TD3DValue): HResult; stdcall;
    function SetUniformScaling(bScale: BOOL): HResult; stdcall;
    function SetCamera(lpCamera: IDirect3DRMFrame3): HResult; stdcall;
    function SetProjection(rptType: TD3DRMProjectionType): HResult; stdcall;
    function Transform(var lprvDst: TD3DRMVector4D; const lprvSrc: TD3DVector): HResult; stdcall;
    function InverseTransform(var lprvDst: TD3DVector;
        const lprvSrc: TD3DRMVector4D): HResult; stdcall;
    function Configure(lX, lY: Longint; dwWidth, dwHeight: DWORD): HResult; stdcall;
    function ForceUpdate(dwX1, dwY1, dwX2, dwY2: DWORD): HResult; stdcall;
    function SetPlane(rvLeft, rvRight, rvBottom, rvTop: TD3DValue): HResult; stdcall;
    function GetCamera(out lpCamera: IDirect3DRMFrame3): HResult; stdcall;
    function GetDevice(out lpD3DRMDevice: IDirect3DRMDevice3): HResult;  stdcall;
    function GetPlane(var lpd3dvLeft, lpd3dvRight, lpd3dvBottom,
        lpd3dvTop: TD3DValue): HResult; stdcall;
    function Pick(lX, lY: Longint; out lplpVisuals: IDirect3DRMPickedArray): HResult; stdcall;
    function GetUniformScaling: BOOL; stdcall;
    function GetX: Longint; stdcall;
    function GetY: Longint; stdcall;
    function GetWidth: DWORD; stdcall;
    function GetHeight: DWORD; stdcall;
    function GetField: TD3DValue; stdcall;
    function GetBack: TD3DValue; stdcall;
    function GetFront: TD3DValue; stdcall;
    function GetProjection: TD3DRMProjectionType; stdcall;
    function GetDirect3DViewport(out lplpD3DViewport: IDirect3DViewport): HResult; stdcall;
    function TransformVectors(dwNumVectors: DWORD; var lpDstVectors: TD3DRMVector4D;
        const lpSrcVectors: TD3DVector): HResult; stdcall;
    function InverseTransformVectors(dwNumVectors: DWORD; var lpDstVectors: TD3DVector;
        const lpSrcVectors: TD3DRMVector4D): HResult; stdcall;
  end;

  IDirect3DRMFrame = interface(IDirect3DRMVisual)
    ['{EB16CB03-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMFrame methods
    function AddChild(lpD3DRMFrameChild: IDirect3DRMFrame): HResult; stdcall;
    function AddLight(lpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function AddMoveCallback(d3drmFMC: TD3DRMFrameMoveCallback;
        lpArg: Pointer): HResult; stdcall;
    function AddTransform(rctCombine: TD3DRMCombineType;
        rmMatrix: TD3DRMMatrix4D): HResult; stdcall;
    function AddTranslation(rctCombine: TD3DRMCombineType; rvX, rvY,
        rvZ: TD3DValue): HResult; stdcall;
    function AddScale(rctCombine: TD3DRMCombineType; rvX, rvY,
        rvZ: TD3DValue): HResult; stdcall;
    function AddRotation(rctCombine: TD3DRMCombineType; rvX, rvY, rvZ,
        rvTheta: TD3DValue): HResult; stdcall;
    function AddVisual(lpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function GetChildren(out lplpChildren: IDirect3DRMFrameArray): HResult; stdcall;
    function GetColor: TD3DColor; stdcall;
    function GetLights(out lplpLights: IDirect3DRMLightArray): HResult; stdcall;
    function GetMaterialMode: TD3DRMMaterialMode; stdcall;
    function GetParent(out lplpParent: IDirect3DRMFrame): HResult; stdcall;
    function GetPosition(lpRef: IDirect3DRMFrame; var lprvPos: TD3DVector): HResult; stdcall;
    function GetRotation(lpRef: IDirect3DRMFrame; var lprvAxis: TD3DVector;
        var lprvTheta: TD3DValue): HResult; stdcall;
    function GetScene(out lplpRoot: IDirect3DRMFrame): HResult; stdcall;
    function GetSortMode: TD3DRMSortMode; stdcall;
    function GetTexture(out lplpTexture: IDirect3DRMTexture): HResult; stdcall;
    function GetTransform(var rmMatrix: TD3DRMMatrix4D): HResult; stdcall;
    function GetVelocity(lpRef: IDirect3DRMFrame; var lprvVel: TD3DVector;
        fRotVel: BOOL): HResult; stdcall;
    function GetOrientation(lpRef: IDirect3DRMFrame; var lprvDir: TD3DVector;
        var lprvUp: TD3DVector): HResult; stdcall;
    function GetVisuals(out lplpVisuals: IDirect3DRMVisualArray): HResult; stdcall;
    function GetTextureTopology(var lpU, lpV: BOOL): HResult; stdcall;
    function InverseTransform(var lprvDst, lprvSrc: TD3DVector): HResult; stdcall;
    function Load(lpvObjSource: Pointer; lpvObjID: Pointer;
        d3drmLOFlags: TD3DRMLoadOptions; d3drmLoadTextureProc:
        TD3DRMLoadTextureCallback; lpArgLTP: Pointer): HResult; stdcall;
    function LookAt(lpTarget, lpRef: IDirect3DRMFrame;
        rfcConstraint: TD3DRMFrameConstraint ): HResult; stdcall;
    function Move(delta: TD3DValue): HResult; stdcall;
    function DeleteChild(lpChild: IDirect3DRMFrame): HResult; stdcall;
    function DeleteLight(lpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function DeleteMoveCallback(d3drmFMC: TD3DRMFrameMoveCallback;
        lpArg: Pointer): HResult; stdcall;
    function DeleteVisual(lpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function GetSceneBackground: TD3DColor; stdcall;
    function GetSceneBackgroundDepth(out lplpDDSurface: IDirectDrawSurface): HResult; stdcall;
    function GetSceneFogColor: TD3DColor; stdcall;
    function GetSceneFogEnable: BOOL; stdcall;
    function GetSceneFogMode: TD3DRMFogMode; stdcall;
    function GetSceneFogParams(var lprvStart, lprvEnd, lprvDensity: TD3DValue): HResult; stdcall;
    function SetSceneBackground(rcColor: TD3DColor): HResult; stdcall;
    function SetSceneBackgroundRGB(rvRed, rvGreen, rvBlue: TD3DValue): HResult; stdcall;
    function SetSceneBackgroundDepth(lpImage: IDirectDrawSurface): HResult; stdcall;
    function SetSceneBackgroundImage(lpTexture: IDirect3DRMTexture): HResult; stdcall;
    function SetSceneFogEnable(bEnable: BOOL): HResult; stdcall;
    function SetSceneFogColor(rcColor: TD3DColor): HResult; stdcall;
    function SetSceneFogMode(rfMode: TD3DRMFogMode): HResult; stdcall;
    function SetSceneFogParams(rvStart, rvEnd, rvDensity: TD3DValue): HResult; stdcall;
    function SetColor(rcColor: TD3DColor): HResult; stdcall;
    function SetColorRGB(rvRed, rvGreen, rvBlue: TD3DValue): HResult; stdcall;
    function GetZbufferMode: TD3DRMZBufferMode; stdcall;
    function SetMaterialMode(rmmMode: TD3DRMMaterialMode): HResult; stdcall;
    function SetOrientation(lpRef: IDirect3DRMFrame; rvDx, rvDy, rvDz, rvUx,
        rvUy, rvUz: TD3DValue): HResult; stdcall;
    function SetPosition(lpRef: IDirect3DRMFrame; rvX, rvY, rvZ: TD3DValue): HResult; stdcall;
    function SetRotation(lpRef: IDirect3DRMFrame; rvX, rvY, rvZ,
        rvTheta: TD3DValue): HResult; stdcall;
    function SetSortMode(d3drmSM: TD3DRMSortMode): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function SetVelocity(lpRef: IDirect3DRMFrame; rvX, rvY, rvZ: TD3DValue;
        fRotVel: BOOL): HResult; stdcall;
    function SetZbufferMode(d3drmZBM: TD3DRMZBufferMode): HResult; stdcall;
    function Transform(var lpd3dVDst, lpd3dVSrc: TD3DVector): HResult; stdcall;
  end;

  IDirect3DRMFrame2 = interface(IDirect3DRMFrame)
    ['{C3DFBD60-3988-11D0-9EC2-0000C0291AC3}']
    // IDirect3DRMFrame2 methods
    function AddMoveCallback2(d3drmFMC: TD3DRMFrameMoveCallback; lpArg:
        Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function GetBoxEnable: BOOL; stdcall;
    function GetAxes(var dir, up: TD3DVector): HResult; stdcall;
    function GetMaterial(out lplpMaterial: IDirect3DRMMaterial): HResult; stdcall;
    function GetInheritAxes: BOOL; stdcall;
    function GetHierarchyBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function SetBox(const lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function SetBoxEnable(bEnableFlag: BOOL): HResult; stdcall;
    function SetAxes(dx, dy, dz, ux, uy, uz: TD3DValue): HResult; stdcall;
    function SetInheritAxes(inherit_from_parent: BOOL): HResult; stdcall;
    function SetMaterial(lplpMaterial: IDirect3DRMMaterial): HResult; stdcall;
    function SetQuaternion(lpRef: IDirect3DRMFrame2; var quat: TD3DRMQuaternion): HResult; stdcall;
    function RayPick(lpRefFrame: IDirect3DRMFrame; const ray: TD3DRMRay;
        dwFlags: DWORD; out lplpPicked2Array: IDirect3DRMPicked2Array): HResult; stdcall;
    function Save(lpFilename: PChar; d3dFormat: TD3DRMXOFFormat;
        d3dSaveFlags: TD3DRMSaveOptions): HResult; stdcall;
  end;

  IDirect3DRMFrame3 = interface(IDirect3DRMVisual)
    ['{FF6B7F70-A40E-11D1-91F9-0000F8758E66}']
    // IDirect3DRMFrame methods
    function AddChild(lpD3DRMFrameChild: IDirect3DRMFrame3): HResult; stdcall;
    function AddLight(lpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function AddMoveCallback(d3drmFMC: TD3DRMFrameMoveCallback;
        lpArg: Pointer): HResult; stdcall;
    function AddTransform(rctCombine: TD3DRMCombineType;
        rmMatrix: TD3DRMMatrix4D): HResult; stdcall;
    function AddTranslation(rctCombine: TD3DRMCombineType; rvX, rvY,
        rvZ: TD3DValue): HResult; stdcall;
    function AddScale(rctCombine: TD3DRMCombineType; rvX, rvY,
        rvZ: TD3DValue): HResult; stdcall;
    function AddRotation(rctCombine: TD3DRMCombineType; rvX, rvY, rvZ,
        rvTheta: TD3DValue): HResult; stdcall;
    function AddVisual(lpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function GetChildren(out lplpChildren: IDirect3DRMFrameArray): HResult; stdcall;
    function GetColor: TD3DColor; stdcall;
    function GetLights(out lplpLights: IDirect3DRMLightArray): HResult; stdcall;
    function GetMaterialMode: TD3DRMMaterialMode; stdcall;
    function GetParent(out lplpParent: IDirect3DRMFrame3): HResult; stdcall;
    function GetPosition(lpRef: IDirect3DRMFrame3; var lprvPos: TD3DVector): HResult; stdcall;
    function GetRotation(lpRef: IDirect3DRMFrame3; var lprvAxis: TD3DVector;
        var lprvTheta: TD3DValue): HResult; stdcall;
    function GetScene(out lplpRoot: IDirect3DRMFrame3): HResult; stdcall;
    function GetSortMode: TD3DRMSortMode; stdcall;
    function GetTexture(out lplpTexture: IDirect3DRMTexture3): HResult; stdcall;
    function GetTransform(var rmMatrix: TD3DRMMatrix4D): HResult; stdcall;
    function GetVelocity(lpRef: IDirect3DRMFrame3; var lprvVel: TD3DVector;
        fRotVel: BOOL): HResult; stdcall;
    function GetOrientation(lpRef: IDirect3DRMFrame3; var lprvDir: TD3DVector;
        var lprvUp: TD3DVector): HResult; stdcall;
    function GetVisuals(out lplpVisuals: IDirect3DRMVisualArray): HResult; stdcall;
    function GetTextureTopology(var lpU, lpV: BOOL): HResult; stdcall;
    function InverseTransform(var lprvDst, lprvSrc: TD3DVector): HResult; stdcall;
    function Load(lpvObjSource: Pointer; lpvObjID: Pointer;
        d3drmLOFlags: TD3DRMLoadOptions; d3drmLoadTextureProc:
        TD3DRMLoadTextureCallback; lpArgLTP: Pointer): HResult; stdcall;
    function LookAt(lpTarget, lpRef: IDirect3DRMFrame3;
        rfcConstraint: TD3DRMFrameConstraint ): HResult; stdcall;
    function Move(delta: TD3DValue): HResult; stdcall;
    function DeleteChild(lpChild: IDirect3DRMFrame3): HResult; stdcall;
    function DeleteLight(lpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function DeleteMoveCallback(d3drmFMC: TD3DRMFrameMoveCallback;
        lpArg: Pointer): HResult; stdcall;
    function DeleteVisual(lpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function GetSceneBackground: TD3DColor; stdcall;
    function GetSceneBackgroundDepth(out lplpDDSurface: IDirectDrawSurface): HResult; stdcall;
    function GetSceneFogColor: TD3DColor; stdcall;
    function GetSceneFogEnable: BOOL; stdcall;
    function GetSceneFogMode: TD3DRMFogMode; stdcall;
    function GetSceneFogParams(var lprvStart, lprvEnd, lprvDensity: TD3DValue): HResult; stdcall;
    function SetSceneBackground(rcColor: TD3DColor): HResult; stdcall;
    function SetSceneBackgroundRGB(rvRed, rvGreen, rvBlue: TD3DValue): HResult; stdcall;
    function SetSceneBackgroundDepth(lpImage: IDirectDrawSurface): HResult; stdcall;
    function SetSceneBackgroundImage(lpTexture: IDirect3DRMTexture3): HResult; stdcall;
    function SetSceneFogEnable(bEnable: BOOL): HResult; stdcall;
    function SetSceneFogColor(rcColor: TD3DColor): HResult; stdcall;
    function SetSceneFogMode(rfMode: TD3DRMFogMode): HResult; stdcall;
    function SetSceneFogParams(rvStart, rvEnd, rvDensity: TD3DValue): HResult; stdcall;
    function SetColor(rcColor: TD3DColor): HResult; stdcall;
    function SetColorRGB(rvRed, rvGreen, rvBlue: TD3DValue): HResult; stdcall;
    function GetZbufferMode: TD3DRMZBufferMode; stdcall;
    function SetMaterialMode(rmmMode: TD3DRMMaterialMode): HResult; stdcall;
    function SetOrientation(lpRef: IDirect3DRMFrame3; rvDx, rvDy, rvDz, rvUx,
        rvUy, rvUz: TD3DValue): HResult; stdcall;
    function SetPosition(lpRef: IDirect3DRMFrame3; rvX, rvY, rvZ: TD3DValue): HResult; stdcall;
    function SetRotation(lpRef: IDirect3DRMFrame3; rvX, rvY, rvZ,
        rvTheta: TD3DValue): HResult; stdcall;
    function SetSortMode(d3drmSM: TD3DRMSortMode): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture3): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function SetVelocity(lpRef: IDirect3DRMFrame3; rvX, rvY, rvZ: TD3DValue;
        fRotVel: BOOL): HResult; stdcall;
    function SetZbufferMode(d3drmZBM: TD3DRMZBufferMode): HResult; stdcall;
    function Transform(var lpd3dVDst, lpd3dVSrc: TD3DVector): HResult; stdcall;
    // IDirect3DRMFrame2 methods
    function GetBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function GetBoxEnable: BOOL; stdcall;
    function GetAxes(var dir, up: TD3DVector): HResult; stdcall;
    function GetMaterial(out lplpMaterial: IDirect3DRMMaterial2): HResult; stdcall;
    function GetInheritAxes: BOOL; stdcall;
    function GetHierarchyBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function SetBox(const lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function SetBoxEnable(bEnableFlag: BOOL): HResult; stdcall;
    function SetAxes(dx, dy, dz, ux, uy, uz: TD3DValue): HResult; stdcall;
    function SetInheritAxes(inherit_from_parent: BOOL): HResult; stdcall;
    function SetMaterial(lplpMaterial: IDirect3DRMMaterial2): HResult; stdcall;
    function SetQuaternion(lpRef: IDirect3DRMFrame3; var quat: TD3DRMQuaternion): HResult; stdcall;
    function RayPick(lpRefFrame: IDirect3DRMFrame3; const ray: TD3DRMRay;
        dwFlags: DWORD; out lplpPicked2Array: IDirect3DRMPicked2Array): HResult; stdcall;
    function Save(lpFilename: PChar; d3dFormat: TD3DRMXOFFormat;
        d3dSaveFlags: TD3DRMSaveOptions): HResult; stdcall;
    // IDirect3DRMFrame3 methods
    function TransformVectors(reference: IDirect3DRMFrame3; dwNumVectors: DWORD;
        var lpDstVectors: TD3DVector; const lpSrcVectors: TD3DVector): HResult; stdcall;
    function InverseTransformVectors(reference: IDirect3DRMFrame3; dwNumVectors: DWORD;
        var lpDstVectors: TD3DVector; const lpSrcVectors: TD3DVector): HResult; stdcall;
    function SetTraversalOptions(dwFlags: DWORD): HResult; stdcall;
    function GetTraversalOptions(var lpdwFlags: DWORD): HResult; stdcall;
    function SetSceneFogMethod(dwFlags: DWORD): HResult; stdcall;
    function GetSceneFogMethod(var lpdwFlags: DWORD): HResult; stdcall;
    function SetMaterialOverride(lpdmOverride: TD3DRMMaterialOverride): HResult; stdcall;
    function GetMaterialOverride(var lplpdmOverride: TD3DRMMaterialOverride): HResult; stdcall;
  end;

  IDirect3DRMMesh = interface(IDirect3DRMVisual)
    ['{A3A80D01-6E12-11CF-AC4A-0000C03825A1}']
    // IDirect3DRMMesh methods
    function Scale(sx, sy, sz: TD3DValue): HResult; stdcall;
    function Translate(tx, ty, tz: TD3DValue): HResult; stdcall;
    function GetBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function AddGroup(vCount, fCount, vPerFace: DWORD; var fData: DWORD;
        var returnId: TD3DRMGroupIndex): HResult; stdcall;
    function SetVertices(id: TD3DRMGroupIndex; index, count: DWORD;
        var values: TD3DRMVertex): HResult; stdcall;
    function SetGroupColor(id: TD3DRMGroupIndex; value: TD3DColor): HResult; stdcall;
    function SetGroupColorRGB(id: TD3DRMGroupIndex; red, green,
        blue: TD3DValue): HResult; stdcall;
    function SetGroupMapping(id: TD3DRMGroupIndex;
        value: TD3DRMMapping): HResult; stdcall;
    function SetGroupQuality(id: TD3DRMGroupIndex;
        value: TD3DRMRenderQuality): HResult; stdcall;
    function SetGroupMaterial(id: TD3DRMGroupIndex; value:
        IDirect3DRMMaterial): HResult; stdcall;
    function SetGroupTexture(id: TD3DRMGroupIndex; value: IDirect3DRMTexture): HResult; stdcall;
    function GetGroupCount: DWORD; stdcall;
    function GetGroup(id: TD3DRMGroupIndex; var vCount, fCount, vPerFace,
        fDataSize, fData: DWORD): HResult; stdcall;
    function GetVertices(id: TD3DRMGroupIndex; index: DWORD; count: DWORD;
        var returnPtr: TD3DRMVertex): HResult; stdcall;
    function GetGroupColor(id: TD3DRMGroupIndex): TD3DColor; stdcall;
    function GetGroupMapping(id: TD3DRMGroupIndex): TD3DRMMapping; stdcall;
    function GetGroupQuality(id: TD3DRMGroupIndex): TD3DRMRenderQuality; stdcall;
    function GetGroupMaterial(id: TD3DRMGroupIndex;
        out returnPtr: IDirect3DRMMaterial): HResult; stdcall;
    function GetGroupTexture(id: TD3DRMGroupIndex;
        out returnPtr: IDirect3DRMTexture): HResult; stdcall;
  end;

  IDirect3DRMProgressiveMesh = interface(IDirect3DRMVisual)
    ['{4516EC79-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMProgressiveMesh methods
    function Load(lpSource, lpObjID: pointer; dloLoadflags: TD3DRMLoadOptions;
        lpCallback: TD3DRMLoadTextureCallback; lpArg: pointer): HResult; stdcall;
    function GetLoadStatus(var lpStatus: TD3DRMPMeshLoadStatus): HResult; stdcall;
    function SetMinRenderDetail(d3dVal: TD3DValue): HResult; stdcall;
    function Abort(dwFlags: DWORD): HResult; stdcall;
    function GetFaceDetail(var lpdwCount: DWORD): HResult; stdcall;
    function GetVertexDetail(var lpdwCount: DWORD): HResult; stdcall;
    function SetFaceDetail(dwCount: DWORD): HResult; stdcall;
    function SetVertexDetail(dwCount: DWORD): HResult; stdcall;
    function GetFaceDetailRange(var lpdwMin, lpdwMax: DWORD): HResult; stdcall;
    function GetVertexDetailRange(var lpdwMin, lpdwMax: DWORD): HResult; stdcall;
    function GetDetail(var lpdvVal: TD3DValue): HResult; stdcall;
    function SetDetail(lpdvVal: TD3DValue): HResult; stdcall;
    function RegisterEvents(hEvent: THANDLE; dwFlags, dwReserved: DWORD): HResult; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function Duplicate(out lplpD3DRMPMesh: IDirect3DRMProgressiveMesh): HResult; stdcall;
    function GetBox(var lpBBox: TD3DRMBox): HResult; stdcall;
    function SetQuality(quality: TD3DRMRenderQuality): HResult; stdcall;
    function GetQuality(var lpdwquality: TD3DRMRenderQuality): HResult; stdcall;
  end;

  IDirect3DRMShadow = interface(IDirect3DRMVisual)
    ['{AF359780-6BA3-11CF-AC4A-0000C03825A1}']
    // IDirect3DRMShadow methods
    function Init(lpD3DRMVisual: IDirect3DRMVisual;
        lpD3DRMLight: IDirect3DRMLight; px, py, pz, nx, ny, nz: TD3DValue): HResult; stdcall;
  end;

  IDirect3DRMShadow2 = interface(IDirect3DRMShadow)
    ['{86B44E25-9C82-11D1-BB0B-00A0C981A0A6}']
    // IDirect3DRMShadow2 methods
    function GetVisual(out lplpDirect3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function SetVisual(pUNK: IUnknown; dwFlags: DWORD): HResult; stdcall;
    function GetLight(out lplpDirect3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function SetLight(lpDirect3DRMLight: IDirect3DRMLight; dwFlags: DWORD): HResult; stdcall;
    function GetPlane(var px, py, pz: TD3DValue; var nx, ny, nz: TD3DValue): HResult; stdcall;
    function SetPlane(px, py, pz: TD3DValue; nx, ny, nz: TD3DValue): HResult; stdcall;
    function GetOptions(var pdwOptions: DWORD): HResult; stdcall;
    function SetOptions(dwOptions: DWORD): HResult; stdcall;
  end;

  IDirect3DRMFace = interface(IDirect3DRMObject)
    ['{EB16CB07-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMFace methods
    function AddVertex(x, y, z: TD3DValue): HResult; stdcall;
    function AddVertexAndNormalIndexed(vertex: DWORD; normal: DWORD): HResult; stdcall;
    function SetColorRGB(red, green, blue: TD3DValue): HResult; stdcall;
    function SetColor(color: TD3DColor): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture): HResult; stdcall;
    function SetTextureCoordinates(vertex: DWORD; u, v: TD3DValue): HResult; stdcall;
    function SetMaterial(lpMat: IDirect3DRMMaterial): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function GetVertex(index: DWORD; var lpPosition: TD3DVector; var lpNormal: TD3DVector): HResult; stdcall;
    function GetVertices(var lpdwVertexCount: DWORD; var lpPosition, lpNormal: TD3DVector): HResult; stdcall;
    function GetTextureCoordinates(index: DWORD; var lpU, lpV: TD3DValue): HResult; stdcall;
    function GetTextureTopology(var lpU, lpV: BOOL): HResult; stdcall;
    function GetNormal(var lpNormal: TD3DVector): HResult; stdcall;
    function GetTexture(out lplpTexture: IDirect3DRMTexture): HResult; stdcall;
    function GetMaterial(out lpMat: IDirect3DRMMaterial): HResult; stdcall;
    function GetVertexCount: Longint; stdcall;
    function GetVertexIndex(dwIndex: DWORD): Longint; stdcall;
    function GetTextureCoordinateIndex(dwIndex: DWORD): Longint; stdcall;
    function GetColor: TD3DColor; stdcall;
  end;

  IDirect3DRMFace2 = interface(IDirect3DRMObject)
    ['{4516EC81-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMFace methods
    function AddVertex(x, y, z: TD3DValue): HResult; stdcall;
    function AddVertexAndNormalIndexed(vertex: DWORD; normal: DWORD): HResult; stdcall;
    function SetColorRGB(red, green, blue: TD3DValue): HResult; stdcall;
    function SetColor(color: TD3DColor): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture3): HResult; stdcall;
    function SetTextureCoordinates(vertex: DWORD; u, v: TD3DValue): HResult; stdcall;
    function SetMaterial(lpMat: IDirect3DRMMaterial2): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function GetVertex(index: DWORD; var lpPosition: TD3DVector; var lpNormal: TD3DVector): HResult; stdcall;
    function GetVertices(var lpdwVertexCount: DWORD; var lpPosition, lpNormal: TD3DVector): HResult; stdcall;
    function GetTextureCoordinates(index: DWORD; var lpU, lpV: TD3DValue): HResult; stdcall;
    function GetTextureTopology(var lpU, lpV: BOOL): HResult; stdcall;
    function GetNormal(var lpNormal: TD3DVector): HResult; stdcall;
    function GetTexture(out lplpTexture: IDirect3DRMTexture3): HResult; stdcall;
    function GetMaterial(out lpMat: IDirect3DRMMaterial2): HResult; stdcall;
    function GetVertexCount: Longint; stdcall;
    function GetVertexIndex(dwIndex: DWORD): Longint; stdcall;
    function GetTextureCoordinateIndex(dwIndex: DWORD): Longint; stdcall;
    function GetColor: TD3DColor; stdcall;
  end;

  IDirect3DRMMeshBuilder = interface(IDirect3DRMVisual)
    ['{A3A80D02-6E12-11CF-AC4A-0000C03825A1}']
    // IDirect3DRMMeshBuilder methods
    function Load(lpvObjSource, lpvObjID: Pointer; d3drmLOFlags: TD3DRMLoadOptions;
        d3drmLoadTextureProc: TD3DRMLoadTextureCallback; lpvArg: Pointer): HResult; stdcall;
    function Save(lpFilename: PChar; TD3DRMXOFFormat: TD3DRMXOFFormat;
        d3drmSOContents: TD3DRMSaveOptions): HResult; stdcall;
    function Scale(sx, sy, sz: TD3DValue): HResult; stdcall;
    function Translate(tx, ty, tz: TD3DValue): HResult; stdcall;
    function SetColorSource(source: TD3DRMColorSource): HResult; stdcall;
    function GetBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function GenerateNormals: HResult; stdcall;
    function GetColorSource: TD3DRMColorSource; stdcall;
    function AddMesh(lpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function AddMeshBuilder(lpD3DRMMeshBuild: IDirect3DRMMeshBuilder): HResult; stdcall;
    function AddFrame(lpD3DRMFrame: IDirect3DRMFrame): HResult; stdcall;
    function AddFace(lpD3DRMFace: IDirect3DRMFace): HResult; stdcall;
    function AddFaces(dwVertexCount: DWORD; var lpD3DVertices: TD3DVector;
        normalCount: DWORD; var lpNormals: TD3DVector; var lpFaceData: DWORD;
        out lplpD3DRMFaceArray: IDirect3DRMFaceArray): HResult; stdcall;
    function ReserveSpace(vertexCount, normalCount, faceCount: DWORD): HResult; stdcall;
    function SetColorRGB(red, green, blue: TD3DValue): HResult; stdcall;
    function SetColor(color: TD3DColor): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture): HResult; stdcall;
    function SetMaterial(lpIDirect3DRMmaterial: IDirect3DRMMaterial): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function SetQuality(quality: TD3DRMRenderQuality): HResult; stdcall;
    function SetPerspective(perspective: BOOL): HResult; stdcall;
    function SetVertex(index: DWORD; x, y, z: TD3DValue): HResult; stdcall;
    function SetNormal(index: DWORD; x, y, z: TD3DValue): HResult; stdcall;
    function SetTextureCoordinates(index: DWORD; u, v: TD3DValue): HResult; stdcall;
    function SetVertexColor(index: DWORD; color: TD3DColor): HResult; stdcall;
    function SetVertexColorRGB(index: DWORD; red, green, blue: TD3DValue): HResult; stdcall;
    function GetFaces(out lplpD3DRMFaceArray: IDirect3DRMFaceArray): HResult; stdcall;
    function GetVertices(var vcount: DWORD; var vertices: TD3DVector;
        var ncount: DWORD; var normals: TD3DVector; var face_data_size: DWORD;
        var face_data: DWORD): HResult; stdcall;
    function GetTextureCoordinates(index: DWORD; var u, v: TD3DValue): HResult; stdcall;
    function AddVertex(x, y, z: TD3DValue): Longint; stdcall;
    function AddNormal(x, y, z: TD3DValue): Longint; stdcall;
    function CreateFace(out lplpd3drmFace: IDirect3DRMFace): HResult; stdcall;
    function GetQuality: TD3DRMRenderQuality; stdcall;
    function GetPerspective: BOOL; stdcall;
    function GetFaceCount: Longint; stdcall;
    function GetVertexCount: Longint; stdcall;
    function GetVertexColor(index: DWORD): TD3DColor; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
  end;

  IDirect3DRMMeshBuilder2 = interface(IDirect3DRMMeshBuilder)
    ['{4516EC77-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMMeshBuilder2 methods
    function GenerateNormals2(dvCreaseAngle: TD3DValue; dwFlags: DWORD): HResult; stdcall;
    function GetFace(dwIndex: DWORD; out lplpD3DRMFace: IDirect3DRMFace): HResult; stdcall;
  end;

  IDirect3DRMMeshBuilder3 = interface(IDirect3DRMVisual)
    ['{4516EC82-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMMeshBuilder methods
    function Load(lpvObjSource, lpvObjID: Pointer; d3drmLOFlags: TD3DRMLoadOptions;
        d3drmLoadTextureProc: TD3DRMLoadTexture3Callback; lpvArg: Pointer): HResult; stdcall;
    function Save(lpFilename: PChar; TD3DRMXOFFormat: TD3DRMXOFFormat;
        d3drmSOContents: TD3DRMSaveOptions): HResult; stdcall;
    function Scale(sx, sy, sz: TD3DValue): HResult; stdcall;
    function Translate(tx, ty, tz: TD3DValue): HResult; stdcall;
    function SetColorSource(source: TD3DRMColorSource): HResult; stdcall;
    function GetBox(var lpD3DRMBox: TD3DRMBox): HResult; stdcall;
    function GenerateNormals: HResult; stdcall;
    function GetColorSource: TD3DRMColorSource; stdcall;
    function AddMesh(lpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function AddMeshBuilder(lpD3DRMMeshBuild: IDirect3DRMMeshBuilder3): HResult; stdcall;
    function AddFrame(lpD3DRMFrame: IDirect3DRMFrame3): HResult; stdcall;
    function AddFace(lpD3DRMFace: IDirect3DRMFace2): HResult; stdcall;
    function AddFaces(dwVertexCount: DWORD; var lpD3DVertices: TD3DVector;
        normalCount: DWORD; var lpNormals: TD3DVector; var lpFaceData: DWORD;
        out lplpD3DRMFaceArray: IDirect3DRMFaceArray): HResult; stdcall;
    function ReserveSpace(vertexCount, normalCount, faceCount: DWORD): HResult; stdcall;
    function SetColorRGB(red, green, blue: TD3DValue): HResult; stdcall;
    function SetColor(color: TD3DColor): HResult; stdcall;
    function SetTexture(lpD3DRMTexture: IDirect3DRMTexture3): HResult; stdcall;
    function SetMaterial(lpDirect3DRMMaterial: IDirect3DRMMaterial2): HResult; stdcall;
    function SetTextureTopology(cylU, cylV: BOOL): HResult; stdcall;
    function SetQuality(quality: TD3DRMRenderQuality): HResult; stdcall;
    function SetPerspective(perspective: BOOL): HResult; stdcall;
    function SetVertex(index: DWORD; x, y, z: TD3DValue): HResult; stdcall;
    function SetNormal(index: DWORD; x, y, z: TD3DValue): HResult; stdcall;
    function SetTextureCoordinates(index: DWORD; u, v: TD3DValue): HResult; stdcall;
    function SetVertexColor(index: DWORD; color: TD3DColor): HResult; stdcall;
    function SetVertexColorRGB(index: DWORD; red, green, blue: TD3DValue): HResult; stdcall;
    function GetFaces(out lplpD3DRMFaceArray: IDirect3DRMFaceArray): HResult; stdcall;
    function GetTextureCoordinates(index: DWORD; var u, v: TD3DValue): HResult; stdcall;
    function AddVertex(x, y, z: TD3DValue): Longint; stdcall;
    function AddNormal(x, y, z: TD3DValue): Longint; stdcall;
    function CreateFace(out lplpd3drmFace: IDirect3DRMFace2): HResult; stdcall;
    function GetQuality: TD3DRMRenderQuality; stdcall;
    function GetPerspective: BOOL; stdcall;
    function GetFaceCount: Longint; stdcall;
    function GetVertexCount: Longint; stdcall;
    function GetVertexColor(index: DWORD): TD3DColor; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    // IDirect3DRMMeshBuilder3 methods
    function GetFace(dwIndex: DWORD; out lplpD3DRMFace: IDirect3DRMFace2): HResult; stdcall;
    function GetVertex(dwIndex: DWORD; var lpVector: TD3DVector): HResult; stdcall;
    function GetNormal(dwIndex: DWORD; var lpVector: TD3DVector): HResult; stdcall;
    function DeleteVertices(dwIndexFirst: DWORD; dwCount: DWORD): HResult; stdcall;
    function DeleteNormals(dwIndexFirst: DWORD; dwCount: DWORD): HResult; stdcall;
    function DeleteFace(lpD3DRMFace: IDirect3DRMFace2): HResult; stdcall;
    function Empty(dwFlags: DWORD): HResult; stdcall;
    function Optimize(dwFlags: DWORD): HResult; stdcall;
    function AddFacesIndexed(dwFlags: DWORD; var lpdwvIndices: DWORD;
        var dwIndexFirst: DWORD; var dwCount: DWORD): HResult; stdcall;
    function CreateSubMesh(out lplpUnk: IUnknown): HResult; stdcall;
    function GetParentMesh(dwFlags: DWORD; out lplpUnk: IUnknown): HResult; stdcall;
    function GetSubMeshes(var lpdwCount: DWORD; out lplpUnk: IUnknown): HResult; stdcall;
    function DeleteSubMesh(lpUnk: IUnknown): HResult; stdcall;
    function Enable(dwFlags: DWORD): HResult; stdcall;
    function GetEnable(var lpdwFlags: DWORD): HResult; stdcall;
    function AddTriangles(dwFlags: DWORD; dwFormat: DWORD; dwVertexCount: DWORD;
        lpvData: Pointer): HResult; stdcall;
    function SetVertices(dwIndexFirst: DWORD; dwCount: DWORD;
        const lpdvVector: TD3DVector): HResult; stdcall;
    function GetVertices(dwIndexFirst: DWORD; var lpdwCount: DWORD;
        var lpdvVector: TD3DVector): HResult; stdcall;
    function SetNormals(dwIndexFirst: DWORD; dwCount: DWORD;
        const lpdvVector: TD3DVector): HResult; stdcall;
    function GetNormals(dwIndexFirst: DWORD; var lpdwCount: DWORD;
        var lpdvVector: TD3DVector): HResult; stdcall;
    function GetNormalCount: Longint; stdcall;
  end;

  IDirect3DRMLight = interface(IDirect3DRMObject)
    ['{EB16CB08-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMLight methods
    function SetType(d3drmtType: TD3DRMLightType): HResult; stdcall;
    function SetColor(rcColor: TD3DColor): HResult; stdcall;
    function SetColorRGB(rvRed, rvGreen, rvBlue: TD3DValue): HResult; stdcall;
    function SetRange(rvRange: TD3DValue): HResult; stdcall;
    function SetUmbra(rvAngle: TD3DValue): HResult; stdcall;
    function SetPenumbra(rvAngle: TD3DValue): HResult; stdcall;
    function SetConstantAttenuation(rvAtt: TD3DValue): HResult; stdcall;
    function SetLinearAttenuation(rvAtt: TD3DValue): HResult; stdcall;
    function SetQuadraticAttenuation(rvAtt: TD3DValue): HResult; stdcall;
    function GetRange: TD3DValue; stdcall;
    function GetUmbra: TD3DValue; stdcall;
    function GetPenumbra: TD3DValue; stdcall;
    function GetConstantAttenuation: TD3DValue; stdcall;
    function GetLinearAttenuation: TD3DValue; stdcall;
    function GetQuadraticAttenuation: TD3DValue; stdcall;
    function GetColor: TD3DColor; stdcall;
    function GetType: TD3DRMLightType; stdcall;
    function SetEnableFrame(lpEnableFrame: IDirect3DRMFrame): HResult; stdcall;
    function GetEnableFrame(out lplpEnableFrame: IDirect3DRMFrame): HResult; stdcall;
  end;

  IDirect3DRMTexture = interface(IDirect3DRMVisual)
    ['{EB16CB09-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMTexture methods
    function InitFromFile(filename: PChar): HResult; stdcall;
    function InitFromSurface(lpDDS: IDirectDrawSurface): HResult; stdcall;
    function InitFromResource(rs: HRSRC): HResult; stdcall;
    function Changed(bPixels, bPalette: BOOL): HResult; stdcall;
    function SetColors(ulColors: DWORD): HResult; stdcall;
    function SetShades(ulShades: DWORD): HResult; stdcall;
    function SetDecalSize(rvWidth, rvHeight: TD3DValue): HResult; stdcall;
    function SetDecalOrigin(lX, lY: Longint): HResult; stdcall;
    function SetDecalScale(dwScale: DWORD): HResult; stdcall;
    function SetDecalTransparency(bTransp: BOOL): HResult; stdcall;
    function SetDecalTransparentColor(rcTransp: TD3DColor): HResult; stdcall;
    function GetDecalSize(var lprvWidth, lprvHeight: TD3DValue): HResult; stdcall;
    function GetDecalOrigin(var lplX, lplY: Longint): HResult; stdcall;
    function GetImage: PD3DRMImage; stdcall;
    function GetShades: DWORD; stdcall;
    function GetColors: DWORD; stdcall;
    function GetDecalScale: DWORD; stdcall;
    function GetDecalTransparency: BOOL; stdcall;
    function GetDecalTransparentColor: TD3DColor; stdcall;
  end;

  IDirect3DRMTexture2 = interface(IDirect3DRMTexture)
    ['{120F30C0-1629-11D0-941C-0080C80CFA7B}']
    // IDirect3DRMTexture2 methods
    function InitFromImage(const lpImage: TD3DRMImage): HResult; stdcall;
    function InitFromResource2(hModule: HModule; strName, strType: PChar): HResult; stdcall;
    function GenerateMIPMap(dwFlags: DWORD): HResult; stdcall;
  end;

  IDirect3DRMTexture3 = interface(IDirect3DRMTexture2)
    ['{FF6B7F73-A40E-11D1-91F9-0000F8758E66}']
    // IDirect3DRMTexture3 methods
    function GetSurface(dwFlags: DWORD; out lplpDDS: IDirectDrawSurface): HResult; stdcall;
    function SetCacheOptions(lImportance: Longint; dwFlags: DWORD): HResult; stdcall;
    function GetCacheOptions(var lplImportance: Longint; var lpdwFlags: DWORD): HResult; stdcall;
    function SetDownsampleCallback(pCallback: TD3DRMDownSampleCallback; pArg: Pointer): HResult; stdcall;
    function SetValidationCallback(pCallback: TD3DRMValidationCallback; pArg: Pointer): HResult; stdcall;
  end;

  IDirect3DRMWrap = interface(IDirect3DRMObject)
    ['{EB16CB0A-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMWrap methods
    function Init(d3drmwt: TD3DRMWrapType; lpd3drmfRef: IDirect3DRMFrame;
        ox, oy, oz, dx, dy, dz, ux, uy, uz, ou, ov, su, sv: TD3DValue): HResult; stdcall;
    function Apply(lpObject: IDirect3DRMObject): HResult; stdcall;
    function ApplyRelative(frame: IDirect3DRMFrame; mesh: IDirect3DRMObject): HResult; stdcall;
  end;

  IDirect3DRMMaterial = interface(IDirect3DRMObject)
    ['{EB16CB0B-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMMaterial methods
    function SetPower(rvPower: TD3DValue): HResult; stdcall;
    function SetSpecular(r, g, b: TD3DValue): HResult; stdcall;
    function SetEmissive(r, g, b: TD3DValue): HResult; stdcall;
    function GetPower: TD3DValue; stdcall;
    function GetSpecular(var r, g, b: TD3DValue): HResult; stdcall;
    function GetEmissive(var r, g, b: TD3DValue): HResult; stdcall;
  end;

  IDirect3DRMMaterial2 = interface(IDirect3DRMMaterial)
    ['{FF6B7F75-A40E-11D1-91F9-0000F8758E66}']
    // IDirect3DRMMaterial2 methods
    function GetAmbient(var r, g, b: TD3DValue): HResult; stdcall;
    function SetAmbient(r, g, b: TD3DValue): HResult; stdcall;
  end;

  IDirect3DRMAnimation = interface(IDirect3DRMObject)
    ['{EB16CB0D-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMAnimation methods
    function SetOptions(d3drmanimFlags: TD3DRMAnimationOptions): HResult; stdcall;
    function AddRotateKey(rvTime: TD3DValue; const rqQuat: TD3DRMQuaternion): HResult; stdcall;
    function AddPositionKey(rvTime, rvX, rvY, rvZ: TD3DValue): HResult; stdcall;
    function AddScaleKey(time, x, y, z: TD3DValue): HResult; stdcall;
    function DeleteKey(time: TD3DValue): HResult; stdcall;
    function SetFrame(lpD3DRMFrame: IDirect3DRMFrame): HResult; stdcall;
    function SetTime(rvTime: TD3DValue): HResult; stdcall;
    function GetOptions: TD3DRMAnimationOptions; stdcall;
  end;

  IDirect3DRMAnimation2 = interface(IDirect3DRMObject)
    ['{FF6B7F77-A40E-11D1-91F9-0000F8758E66}']
    // IDirect3DRMAnimation2 methods
    function SetOptions(d3drmanimFlags: TD3DRMAnimationOptions): HResult; stdcall;
    function AddRotateKey(rvTime: TD3DValue; const rqQuat: TD3DRMQuaternion): HResult; stdcall;
    function AddPositionKey(rvTime, rvX, rvY, rvZ: TD3DValue): HResult; stdcall;
    function AddScaleKey(time, x, y, z: TD3DValue): HResult; stdcall;
    function DeleteKey(time: TD3DValue): HResult; stdcall;
    function SetFrame(lpD3DRMFrame: IDirect3DRMFrame3): HResult; stdcall;
    function SetTime(rvTime: TD3DValue): HResult; stdcall;
    function GetOptions: TD3DRMAnimationOptions; stdcall;
    function GetFrame(out lpD3DFrame: IDirect3DRMFrame3): HResult; stdcall;
    function DeleteKeyByID(dwID: DWORD): HResult; stdcall;
    function AddKey(const lpKey: TD3DRMAnimationKey): HResult; stdcall;
    function ModifyKey(const lpKey: TD3DRMAnimationKey): HResult; stdcall;
    function GetKeys(dvTimeMin, dvTimeMax: TD3DValue; var lpdwNumKeys: DWORD;
        var lpKey: TD3DRMAnimationKey): HResult; stdcall;
  end;

  IDirect3DRMAnimationSet = interface(IDirect3DRMObject)
    ['{EB16CB0E-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMAnimationSet methods
    function AddAnimation(lpD3DRMAnimation: IDirect3DRMAnimation): HResult; stdcall;
    function Load(lpvObjSource, lpvObjID: Pointer; d3drmLOFlags: TD3DRMLoadOptions;
        d3drmLoadTextureProc: TD3DRMLoadTextureCallback; lpArgLTP: Pointer;
        lpParentFrame: IDirect3DRMFrame): HResult; stdcall;
    function DeleteAnimation(lpD3DRMAnimation: IDirect3DRMAnimation): HResult; stdcall;
    function SetTime(rvTime: TD3DValue): HResult; stdcall;
  end;

  IDirect3DRMAnimationSet2 = interface(IDirect3DRMObject)
    ['{FF6B7F79-A40E-11D1-91F9-0000F8758E66}']
    // IDirect3DRMAnimationSet2 methods
    function AddAnimation(aid: IDirect3DRMAnimation2): HResult; stdcall;
    function Load(filename, name: Pointer; loadflags: TD3DRMLoadOptions;
        d3drmLoadTextureProc: TD3DRMLoadTexture3Callback; lpArg: Pointer;
        lpParentFrame: IDirect3DRMFrame3): HResult; stdcall;
    function DeleteAnimation(aid: IDirect3DRMAnimation2): HResult; stdcall;
    function SetTime(time: TD3DValue): HResult; stdcall;
    function GetAnimations(out lpAnimationArray: IDirect3DRMAnimationArray): HResult; stdcall;
  end;

  IDirect3DRMUserVisual = interface(IDirect3DRMVisual)
    ['{59163DE0-6D43-11CF-AC4A-0000C03825A1}']
    // IDirect3DRMUserVisual methods
    function Init(d3drmUVProc: TD3DRMUserVisualCallback; lpArg: Pointer): HResult; stdcall;
  end;

  IDirect3DRMArray = interface(IUnknown)
    function GetSize: DWORD; stdcall;
    (* No GetElement method as it would get overloaded
     * in derived classes, and overloading is
     * a no-no in COM
     *)
  end;

  IDirect3DRMObjectarray = interface(IDirect3DRMArray)
    function GetElement(index: DWORD; out lplpD3DRMObject: IDirect3DRMObject): HResult; stdcall;
  end;

  IDirect3DRMDeviceArray = interface(IDirect3DRMArray)
    ['{EB16CB10-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMDevicearraymethods
    function GetElement(index: DWORD; out lplpD3DRMDevice: IDirect3DRMDevice): HResult; stdcall;
  end;

  IDirect3DRMFrameArray = interface(IDirect3DRMArray)
    ['{EB16CB12-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMFramearraymethods
    function GetElement(index: DWORD; out lplpD3DRMFrame: IDirect3DRMFrame): HResult; stdcall;
  end;

  IDirect3DRMViewportArray = interface(IDirect3DRMArray)
    ['{EB16CB11-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMViewportarraymethods
    function GetElement(index: DWORD; out lplpD3DRMViewport: IDirect3DRMViewport): HResult; stdcall;
  end;

  IDirect3DRMVisualArray = interface(IDirect3DRMArray)
    ['{EB16CB13-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMVisualarraymethods
    function GetElement(index: DWORD; out lplpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
  end;

  IDirect3DRMAnimationArray = interface(IDirect3DRMArray)
    ['{D5F1CAE0-4BD7-11D1-B974-0060083E45F3}']
    function GetElement(index: DWORD; out lplpD3DRMAnimation: IDirect3DRMAnimation2): HResult; stdcall;
  end;

  IDirect3DRMPickedArray = interface(IDirect3DRMArray)
    ['{EB16CB16-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMPickedarraymethods
    function GetPick(index: DWORD; out lplpVisual: IDirect3DRMVisual;
        out lplpFrameArray: IDirect3DRMFrameArray;
        var lpD3DRMPickDesc: TD3DRMPickDesc): HResult; stdcall;
  end;

  IDirect3DRMLightArray = interface(IDirect3DRMArray)
    ['{EB16CB14-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMLightarraymethods
    function GetElement(index: DWORD; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
  end;

  IDirect3DRMFaceArray = interface(IDirect3DRMArray)
    ['{EB16CB17-D271-11CE-AC48-0000C03825A1}']
    // IDirect3DRMFacearraymethods
    function GetElement(index: DWORD; out lplpD3DRMFace: IDirect3DRMFace): HResult; stdcall;
  end;

  IDirect3DRMPicked2Array = interface(IDirect3DRMArray)
    ['{4516EC7B-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMPicked2arraymethods
    function GetPick(index: DWORD; out lplpVisual: IDirect3DRMVisual;
        out lplpFrameArray: IDirect3DRMFrameArray;
        const lpD3DRMPickDesc2: D3DRMPICKDESC2): HResult; stdcall;
  end;

  IDirect3DRMInterpolator = interface(IDirect3DRMObject)
    ['{242F6BC1-3849-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRMInterpolator methods
    function AttachObject(lpD3DRMObject: IDirect3DRMObject): HResult; stdcall;
    function GetAttachedObjects(lpD3DRMObjectArray: IDirect3DRMObjectArray): HResult; stdcall;
    function DetachObject(lpD3DRMObject: IDirect3DRMObject): HResult; stdcall;
    function SetIndex(d3dVal: TD3DValue): HResult; stdcall;
    function GetIndex: TD3DValue; stdcall;
    function Interpolate(d3dVal: TD3DValue; lpD3DRMObject: IDirect3DRMObject;
        d3drmInterpFlags: TD3DRMInterpolationOptions): HResult; stdcall;
  end;

  IDirect3DRMClippedVisual = interface(IDirect3DRMVisual)
    ['{5434E733-6D66-11D1-BB0B-0000F875865A}']
    // IDirect3DRMClippedVisual methods
    function Init(lpD3DRMVisual: IDirect3DRMVisual): HResult; stdcall;
    function AddPlane(lpRef: IDirect3DRMFrame3; const lpdvPoint, lpdvNormal: TD3DVector;
        dwFlags: DWORD; var lpdwReturnID: DWORD): HResult; stdcall;
    function DeletePlane(dwID, dwFlags: DWORD): HResult; stdcall;
    function GetPlaneIDs(var lpdwCount, lpdwID: DWORD; dwFlags: DWORD): HResult; stdcall;
    function GetPlane (dwID: DWORD; lpRef: IDirect3DRMFrame3;
        var lpdvPoint, lpdvNormal: TD3DVector; dwFlags: DWORD): HResult; stdcall;
    function SetPlane (dwID: DWORD; lpRef: IDirect3DRMFrame3;
        const lpdvPoint, lpdvNormal: TD3DVector; dwFlags: DWORD): HResult; stdcall;
  end;

  IDirect3DRMWinDevice = interface(IDirect3DRMObject)
    ['{C5016CC0-D273-11CE-AC48-0000C03825A1}']
    // IDirect3DRMWinDevice methods
    function HandlePaint(hDC: HDC): HResult; stdcall;
    function HandleActivate(wparam: WORD): HResult; stdcall;
  end;

  IDirect3DRM = interface(IUnknown)
    ['{2BC49361-8327-11CF-AC4A-0000C03825A1}']
    // IDirect3DRM methods
    function CreateObject(const rclsid: TGUID; pUnkOuter: IUnknown;
        const riid: TGUID; out ppv): HResult; stdcall;
    function CreateFrame(lpD3DRMFrame: IDirect3DRMFrame;
        out lplpD3DRMFrame: IDirect3DRMFrame): HResult; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function CreateMeshBuilder(out lplpD3DRMMeshBuilder:
        IDirect3DRMMeshBuilder): HResult; stdcall;
    function CreateFace(out lplpd3drmFace: IDirect3DRMFace): HResult; stdcall;
    function CreateAnimation(out lplpD3DRMAnimation: IDirect3DRMAnimation): HResult; stdcall;
    function CreateAnimationSet(out lplpD3DRMAnimationSet:
        IDirect3DRMAnimationSet): HResult; stdcall;
    function CreateTexture(const lpImage: TD3DRMImage;
        out lplpD3DRMTexture: IDirect3DRMTexture): HResult; stdcall;
    function CreateLight(d3drmltLightType: TD3DRMLightType;
        cColor: TD3DColor; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateLightRGB(ltLightType: TD3DRMLightType; vRed, vGreen, vBlue:
        TD3DValue; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateMaterial(vPower: TD3DValue; out lplpD3DRMMaterial:
        IDirect3DRMMaterial): HResult; stdcall;
    function CreateDevice(dwWidth, dwHeight: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice): HResult; stdcall;
    function CreateDeviceFromSurface(const lpGUID: TGUID; lpDD: IDirectDraw;
        lpDDSBack: IDirectDrawSurface; out lplpD3DRMDevice: IDirect3DRMDevice): HResult; stdcall;
    function CreateDeviceFromD3D(lpD3D: IDirect3D; lpD3DDev: IDirect3DDevice;
        out lplpD3DRMDevice: IDirect3DRMDevice): HResult; stdcall;
    function CreateDeviceFromClipper(lpDDClipper: IDirectDrawClipper;
        const lpGUID: TGUID; width, height: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice): HResult; stdcall;
    function CreateTextureFromSurface(lpDDS: IDirectDrawSurface;
        out lplpD3DRMTexture: IDirect3DRMTexture): HResult; stdcall;
    function CreateShadow(lpVisual: IDirect3DRMVisual;
        lpLight: IDirect3DRMLight; px, py, pz, nx, ny, nz: TD3DValue;
        out lplpShadow: IDirect3DRMVisual): HResult; stdcall;
    function CreateViewport(lpDev: IDirect3DRMDevice;
        lpCamera: IDirect3DRMFrame; dwXPos, dwYPos, dwWidth, dwHeight: DWORD;
        out lplpD3DRMViewport: IDirect3DRMViewport): HResult; stdcall;
    function CreateWrap(wraptype: TD3DRMWrapType; lpRef: IDirect3DRMFrame;
        ox, oy, oz, dx, dy, dz, ux, uy, uz, ou, ov, su, sv: TD3DValue;
        out lplpD3DRMWrap: IDirect3DRMWrap): HResult; stdcall;
    function CreateUserVisual(fn: TD3DRMUserVisualCallback; lpArg: Pointer;
        out lplpD3DRMUV: IDirect3DRMUserVisual): HResult; stdcall;
    function LoadTexture(lpFileName: LPSTR; out lplpD3DRMTexture:
        IDirect3DRMTexture): HResult; stdcall;
    function LoadTextureFromResource(rs: HRSRC; out lplpD3DRMTexture:
        IDirect3DRMTexture): HResult; stdcall;
    function SetSearchPath(lpPath: LPSTR): HResult; stdcall;
    function AddSearchPath(lpPath: LPSTR): HResult; stdcall;
    function GetSearchPath(var lpdwSize: DWORD; lpszPath: LPSTR): HResult; stdcall;
    function SetDefaultTextureColors(dwColors: DWORD): HResult; stdcall;
    function SetDefaultTextureShades(dwShades: DWORD): HResult; stdcall;
    function GetDevices(out lplpDevArray: IDirect3DRMDeviceArray): HResult; stdcall;
    function GetNamedObject(lpName: LPSTR; out lplpD3DRMObject:
        IDirect3DRMObject): HResult; stdcall;
    function EnumerateObjects(func: TD3DRMObjectCallback; lpArg: Pointer): HResult; stdcall;
    function Load(lpvObjSource, lpvObjID: Pointer; var lplpGUIDs: PGUID;
        dwcGUIDs: DWORD; d3drmLOFlags: TD3DRMLoadOptions; d3drmLoadProc:
        D3DRMLOADCALLBACK; lpArgLP: Pointer; d3drmLoadTextureProc:
        TD3DRMLoadTextureCallback; lpArgLTP: Pointer;
        lpParentFrame: IDirect3DRMFrame): HResult; stdcall;
    function Tick(d3dvalTick: TD3DValue): HResult; stdcall;
  end;

  IDirect3DRM2 = interface(IUnknown)
    ['{4516ECC8-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRM2 methods
    function CreateObject(const rclsid: TGUID; pUnkOuter: IUnknown;
        const riid: TGUID; out ppv): HResult; stdcall;
    function CreateFrame(lpD3DRMFrame: IDirect3DRMFrame2;
        out lplpD3DRMFrame: IDirect3DRMFrame2): HResult; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function CreateMeshBuilder(out lplpD3DRMMeshBuilder:
        IDirect3DRMMeshBuilder2): HResult; stdcall;
    function CreateFace(out lplpd3drmFace: IDirect3DRMFace): HResult; stdcall;
    function CreateAnimation(out lplpD3DRMAnimation: IDirect3DRMAnimation): HResult; stdcall;
    function CreateAnimationSet(out lplpD3DRMAnimationSet:
        IDirect3DRMAnimationSet): HResult; stdcall;
    function CreateTexture(const lpImage: TD3DRMImage;
        out lplpD3DRMTexture: IDirect3DRMTexture2): HResult; stdcall;
    function CreateLight(d3drmltLightType: TD3DRMLightType;
        cColor: TD3DColor; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateLightRGB(ltLightType: TD3DRMLightType; vRed,
        vGreen, vBlue: TD3DValue; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateMaterial(vPower: TD3DValue; out lplpD3DRMMaterial:
        IDirect3DRMMaterial): HResult; stdcall;
    function CreateDevice(dwWidth, dwHeight: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice2): HResult; stdcall;
    function CreateDeviceFromSurface(const lpGUID: TGUID; lpDD: IDirectDraw;
        lpDDSBack: IDirectDrawSurface; out lplpD3DRMDevice: IDirect3DRMDevice2): HResult; stdcall;
    function CreateDeviceFromD3D(lpD3D: IDirect3D2; lpD3DDev: IDirect3DDevice2;
        out lplpD3DRMDevice: IDirect3DRMDevice2): HResult; stdcall;
    function CreateDeviceFromClipper(lpDDClipper: IDirectDrawClipper;
        const lpGUID: TGUID; width, height: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice2): HResult; stdcall;
    function CreateTextureFromSurface( lpDDS: IDirectDrawSurface;
        out lplpD3DRMTexture: IDirect3DRMTexture2): HResult; stdcall;
    function CreateShadow(lpVisual: IDirect3DRMVisual;
        lpLight: IDirect3DRMLight; px, py, pz, nx, ny, nz: TD3DValue;
        out lplpShadow: IDirect3DRMVisual): HResult; stdcall;
    function CreateViewport(lpDev: IDirect3DRMDevice;
        lpCamera: IDirect3DRMFrame; dwXPos, dwYPos, dwWidth, dwHeight: DWORD;
        out lplpD3DRMViewport: IDirect3DRMViewport): HResult; stdcall;
    function CreateWrap(wraptype: TD3DRMWrapType; lpRef: IDirect3DRMFrame;
        ox, oy, oz, dx, dy, dz, ux, uy, uz, ou, ov, su, sv: TD3DValue;
        out lplpD3DRMWrap: IDirect3DRMWrap): HResult; stdcall;
    function CreateUserVisual(fn: TD3DRMUserVisualCallback; lpArg: Pointer;
        out lplpD3DRMUV: IDirect3DRMUserVisual): HResult; stdcall;
    function LoadTexture(lpFileName: LPSTR; out lplpD3DRMTexture:
        IDirect3DRMTexture2): HResult; stdcall;
    function LoadTextureFromResource(hModule: HModule; str: LPCSTR; out lplpD3DRMTexture:
        IDirect3DRMTexture2): HResult; stdcall;
    function SetSearchPath(lpPath: LPSTR): HResult; stdcall;
    function AddSearchPath(lpPath: LPSTR): HResult; stdcall;
    function GetSearchPath(var lpdwSize: DWORD; lpszPath: LPSTR): HResult; stdcall;
    function SetDefaultTextureColors(dwColors: DWORD): HResult; stdcall;
    function SetDefaultTextureShades(dwShades: DWORD): HResult; stdcall;
    function GetDevices(out lplpDevArray: IDirect3DRMDeviceArray): HResult; stdcall;
    function GetNamedObject(lpName: LPSTR; out lplpD3DRMObject:
        IDirect3DRMObject): HResult; stdcall;
    function EnumerateObjects(func: TD3DRMObjectCallback; lpArg: Pointer): HResult; stdcall;
    function Load(lpvObjSource, lpvObjID: Pointer; var lplpGUIDs: PGUID;
        dwcGUIDs: DWORD; d3drmLOFlags: TD3DRMLoadOptions; d3drmLoadProc:
        D3DRMLOADCALLBACK; lpArgLP: Pointer; d3drmLoadTextureProc:
        TD3DRMLoadTextureCallback; lpArgLTP: Pointer; lpParentFrame:
        IDirect3DRMFrame): HResult; stdcall;
    function Tick(d3dvalTick: TD3DValue): HResult; stdcall;
    function CreateProgressiveMesh(out lplpD3DRMProgressiveMesh:
        IDirect3DRMProgressiveMesh): HResult; stdcall;
  end;

  IDirect3DRM3 = interface(IUnknown)
    ['{4516EC83-8F20-11D0-9B6D-0000C0781BC3}']
    // IDirect3DRM2 methods
    function CreateObject(const rclsid: TGUID; pUnkOuter: IUnknown;
        const riid: TGUID; out ppv): HResult; stdcall;
    function CreateFrame(lpD3DRMFrame: IDirect3DRMFrame3;
        out lplpD3DRMFrame: IDirect3DRMFrame3): HResult; stdcall;
    function CreateMesh(out lplpD3DRMMesh: IDirect3DRMMesh): HResult; stdcall;
    function CreateMeshBuilder(out lplpD3DRMMeshBuilder:
        IDirect3DRMMeshBuilder3): HResult; stdcall;
    function CreateFace(out lplpd3drmFace: IDirect3DRMFace2): HResult; stdcall;
    function CreateAnimation(out lplpD3DRMAnimation: IDirect3DRMAnimation2): HResult; stdcall;
    function CreateAnimationSet(out lplpD3DRMAnimationSet:
        IDirect3DRMAnimationSet2): HResult; stdcall;
    function CreateTexture(const lpImage: TD3DRMImage;
        out lplpD3DRMTexture: IDirect3DRMTexture3): HResult; stdcall;
    function CreateLight(d3drmltLightType: TD3DRMLightType;
        cColor: TD3DColor; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateLightRGB(ltLightType: TD3DRMLightType; vRed,
        vGreen, vBlue: TD3DValue; out lplpD3DRMLight: IDirect3DRMLight): HResult; stdcall;
    function CreateMaterial(vPower: TD3DValue; out lplpD3DRMMaterial:
        IDirect3DRMMaterial2): HResult; stdcall;
    function CreateDevice(dwWidth, dwHeight: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice3): HResult; stdcall;
    function CreateDeviceFromSurface(const lpGUID: TGUID; lpDD: IDirectDraw;
        lpDDSBack: IDirectDrawSurface; out lplpD3DRMDevice: IDirect3DRMDevice3): HResult; stdcall;
    function CreateDeviceFromD3D(lpD3D: IDirect3D2; lpD3DDev: IDirect3DDevice2;
        out lplpD3DRMDevice: IDirect3DRMDevice3): HResult; stdcall;
    function CreateDeviceFromClipper(lpDDClipper: IDirectDrawClipper;
        const lpGUID: TGUID; width, height: DWORD; out lplpD3DRMDevice:
        IDirect3DRMDevice3): HResult; stdcall;
    function CreateTextureFromSurface( lpDDS: IDirectDrawSurface;
        out lplpD3DRMTexture: IDirect3DRMTexture3): HResult; stdcall;
    function CreateShadow(lpVisual: IDirect3DRMVisual;
        lpLight: IDirect3DRMLight; px, py, pz, nx, ny, nz: TD3DValue;
        out lplpShadow: IDirect3DRMShadow): HResult; stdcall;
    function CreateViewport(lpDev: IDirect3DRMDevice3;
        lpCamera: IDirect3DRMFrame3; dwXPos, dwYPos, dwWidth, dwHeight: DWORD;
        out lplpD3DRMViewport: IDirect3DRMViewport2): HResult; stdcall;
    function CreateWrap(wraptype: TD3DRMWrapType; lpRef: IDirect3DRMFrame3;
        ox, oy, oz, dx, dy, dz, ux, uy, uz, ou, ov, su, sv: TD3DValue;
        out lplpD3DRMWrap: IDirect3DRMWrap): HResult; stdcall;
    function CreateUserVisual(fn: TD3DRMUserVisualCallback; lpArg: Pointer;
        out lplpD3DRMUV: IDirect3DRMUserVisual): HResult; stdcall;
    function LoadTexture(lpFileName: LPSTR; out lplpD3DRMTexture:
        IDirect3DRMTexture3): HResult; stdcall;
    function LoadTextureFromResource(hModule: HModule; str: LPCSTR; out lplpD3DRMTexture:
        IDirect3DRMTexture3): HResult; stdcall;

    function SetSearchPath(lpPath: LPSTR): HResult; stdcall;
    function AddSearchPath(lpPath: LPSTR): HResult; stdcall;
    function GetSearchPath(var lpdwSize: DWORD; lpszPath: LPSTR): HResult; stdcall;
    function SetDefaultTextureColors(dwColors: DWORD): HResult; stdcall;
    function SetDefaultTextureShades(dwShades: DWORD): HResult; stdcall;
    function GetDevices(out lplpDevArray: IDirect3DRMDeviceArray): HResult; stdcall;
    function GetNamedObject(lpName: LPSTR; out lplpD3DRMObject:
        IDirect3DRMObject): HResult; stdcall;
    function EnumerateObjects(func: TD3DRMObjectCallback; lpArg: Pointer): HResult; stdcall;
    function Load(lpvObjSource, lpvObjID: Pointer; var lplpGUIDs: PGUID;
        dwcGUIDs: DWORD; d3drmLOFlags: TD3DRMLoadOptions; d3drmLoadProc:
        D3DRMLOADCALLBACK; lpArgLP: Pointer; d3drmLoadTextureProc:
        TD3DRMLoadTexture3Callback; lpArgLTP: Pointer; lpParentFrame:
        IDirect3DRMFrame3): HResult; stdcall;
    function Tick(d3dvalTick: TD3DValue): HResult; stdcall;
    function CreateProgressiveMesh(out lplpD3DRMProgressiveMesh:
        IDirect3DRMProgressiveMesh): HResult; stdcall;
    // IDirect3RM3 methods
    function RegisterClient(const rguid: TGUID; var lpdwID: DWORD): HResult; stdcall;
    function UnregisterClient(const rguid: TGUID): HResult; stdcall;
    function CreateClippedVisual(lpVisual: IDirect3DRMVisual;
        out lpClippedVisual: IDirect3DRMVisual): HResult; stdcall;
    function SetOptions(lpdwOptions: DWORD): HResult; stdcall;
    function GetOptions(var lpdwOptions: DWORD): HResult; stdcall;
  end;

const
  D3DRM_OK                        = DD_OK;
  D3DRMERR_BADOBJECT              = $88760000 + 781;
  D3DRMERR_BADTYPE                = $88760000 + 782;
  D3DRMERR_BADALLOC               = $88760000 + 783;
  D3DRMERR_FACEUSED               = $88760000 + 784;
  D3DRMERR_NOTFOUND               = $88760000 + 785;
  D3DRMERR_NOTDONEYET             = $88760000 + 786;
  D3DRMERR_FILENOTFOUND           = $88760000 + 787;
  D3DRMERR_BADFILE                = $88760000 + 788;
  D3DRMERR_BADDEVICE              = $88760000 + 789;
  D3DRMERR_BADVALUE               = $88760000 + 790;
  D3DRMERR_BADMAJORVERSION        = $88760000 + 791;
  D3DRMERR_BADMINORVERSION        = $88760000 + 792;
  D3DRMERR_UNABLETOEXECUTE        = $88760000 + 793;
  D3DRMERR_LIBRARYNOTFOUND        = $88760000 + 794;
  D3DRMERR_INVALIDLIBRARY         = $88760000 + 795;
  D3DRMERR_PENDING                = $88760000 + 796;
  D3DRMERR_NOTENOUGHDATA          = $88760000 + 797;
  D3DRMERR_REQUESTTOOLARGE        = $88760000 + 798;
  D3DRMERR_REQUESTTOOSMALL        = $88760000 + 799;
  D3DRMERR_CONNECTIONLOST         = $88760000 + 800;
  D3DRMERR_LOADABORTED            = $88760000 + 801;
  D3DRMERR_NOINTERNET             = $88760000 + 802;
  D3DRMERR_BADCACHEFILE           = $88760000 + 803;
  D3DRMERR_BOXNOTSET              = $88760000 + 804;
  D3DRMERR_BADPMDATA              = $88760000 + 805;
  D3DRMERR_CLIENTNOTREGISTERED    = $88760000 + 806;
  D3DRMERR_NOTCREATEDFROMDDS      = $88760000 + 807;
  D3DRMERR_NOSUCHKEY              = $88760000 + 808;
  D3DRMERR_INCOMPATABLEKEY        = $88760000 + 809;
  D3DRMERR_ELEMENTINUSE           = $88760000 + 810;
  D3DRMERR_TEXTUREFORMATNOTFOUND  = $88760000 + 811;
  D3DRMERR_NOTAGGREGATED          = $88760000 + 812;

{ Create a Direct3DRM API }
function Direct3DRMCreate(out lplpDirect3DRM: IDirect3DRM): HResult; stdcall;

(***************************************************************************
 *
 *  Copyright (C) 1998-1999 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dxfile.h
 *
 *  Content:    DirectX File public header file
 *
 ***************************************************************************)

{ DirectXFile Object Class Id (for CoCreateInstance()) }

const
  CLSID_CDirectXFile: TGUID = '{4516EC43-8F20-11D0-9B6D-0000C0781BC3}';

{ DirectX File Interface GUIDs. }

  IID_IDirectXFile = '{3D82AB40-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileEnumObject = '{3D82AB41-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileSaveObject = '{3D82AB42-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileObject = '{3D82AB43-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileData = '{3D82AB44-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileDataReference = '{3D82AB45-62DA-11CF-AB39-0020AF71E433}';
  IID_IDirectXFileBinary = '{3D82AB46-62DA-11CF-AB39-0020AF71E433}';

type
  TDXFileFormat = DWORD;
  DXFILEFORMAT = TDXFileFormat;

const
  DXFILEFORMAT_BINARY     = 0;
  DXFILEFORMAT_TEXT       = 1;
  DXFILEFORMAT_COMPRESSED = 2;

type
  TDXFileLoadOptions = DWORD;
  DXFILELOADOPTIONS = TDXFileLoadOptions;

const
  DXFILELOAD_FROMFILE     = $00;
  DXFILELOAD_FROMRESOURCE = $01;
  DXFILELOAD_FROMMEMORY   = $02;
  DXFILELOAD_FROMSTREAM   = $04;
  DXFILELOAD_FROMURL      = $08;

type
  PDXFileLoadResource = ^TDXFileLoadResource;
  TDXFileLoadResource = record
    hModule: HModule;
    lpName: PChar;
    lpType: PChar;
  end;

  DXFILELOADRESOURCE = TDXFileLoadResource;
  LPDXFILELOADRESOURCE = PDXFileLoadResource;

  PDXFileLoadMemory = ^TDXFileLoadMemory;
  TDXFileLoadMemory = record
    lpMemory: Pointer;
    dSize: DWORD;
  end;

  DXFILELOADMEMORY = TDXFileLoadMemory;
  LPDXFILELOADMEMORY = PDXFileLoadMemory;

{ DirectX File object types. }

type
  IDirectXFile = interface;
  IDirectXFileEnumObject = interface;
  IDirectXFileSaveObject = interface;
  IDirectXFileObject = interface;
  IDirectXFileData = interface;
  IDirectXFileDataReference = interface;
  IDirectXFileBinary = interface;

  IDirectXFile = interface(IUnknown)
    ['{3D82AB40-62DA-11CF-AB39-0020AF71E433}']
    function CreateEnumObject(pvSource: Pointer; dwLoadOptions: TDXFileLoadOptions;
        out ppEnumObj: IDirectXFileEnumObject): HResult; stdcall;
    function CreateSaveObject(szFileName: PChar; dwFileFormat: TDXFileFormat;
        out ppSaveObj: IDirectXFileSaveObject): HResult; stdcall;
    function RegisterTemplates(pvData: Pointer; cbSize: DWORD): HResult; stdcall;
  end;

  IDirectXFileEnumObject = interface(IUnknown)
    ['{3D82AB41-62DA-11CF-AB39-0020AF71E433}']
    function GetNextDataObject(out ppDataObj: IDirectXFileData): HResult; stdcall;
    function GetDataObjectById(const rguid: TGUID; out ppDataObj: IDirectXFileData): HResult; stdcall;
    function GetDataObjectByName(szName: PChar; out ppDataObj: IDirectXFileData): HResult; stdcall;
  end;

  IDirectXFileSaveObject = interface(IUnknown)
    ['{3D82AB42-62DA-11CF-AB39-0020AF71E433}']
    function SaveTemplates(cTemplates: DWORD; var ppguidTemplates: PGUID): HResult; stdcall;
    function CreateDataObject(const rguidTemplate: TGUID; szName: PChar;
        const pguid: TGUID; cbSize: DWORD; pvData: Pointer;
        out ppDataObj: IDirectXFileData): HResult; stdcall;
    function SaveData(pDataObj: IDirectXFileData): HResult; stdcall;
  end;

  IDirectXFileObject = interface(IUnknown)
    ['{3D82AB43-62DA-11CF-AB39-0020AF71E433}']
    function GetName(pstrNameBuf: PChar; var dwBufLen: DWORD): HResult; stdcall;
    function GetId (var pGuidBuf: TGUID): HResult; stdcall;
  end;

  IDirectXFileData = interface(IDirectXFileObject)
    ['{3D82AB44-62DA-11CF-AB39-0020AF71E433}']
    function GetData(szMember: PChar; var pcbSize: DWORD; var ppvData: Pointer): HResult; stdcall;
    function GetType(var ppguid: PGUID): HResult; stdcall;
    function GetNextObject(out ppChildObj: IDirectXFileObject): HResult; stdcall;
    function AddDataObject(pDataObj: IDirectXFileData): HResult; stdcall;
    function AddDataReference(szRef: PChar; pguidRef: PGUID): HResult; stdcall;
    function AddBinaryObjec (szName: PChar; pguid: PGUID; szMimeType: PChar;
        pvData: Pointer; cbSize: DWORD): HResult; stdcall;
  end;

  IDirectXFileDataReference = interface(IDirectXFileObject)
    ['{3D82AB45-62DA-11CF-AB39-0020AF71E433}']
    function Resolve(out ppDataObj: IDirectXFileData): HResult; stdcall;
  end;

  IDirectXFileBinary = interface(IDirectXFileObject)
    ['{3D82AB46-62DA-11CF-AB39-0020AF71E433}']
    function GetSize(var pcbSize: DWORD): HResult; stdcall;
    function GetMimeType(var pszMimeType: PChar): HResult; stdcall;
    function Read(pvData: Pointer; cbSize: DWORD; var pcbRead: DWORD): HResult; stdcall;
  end;

{ DirectX File Header template's GUID. }

const
  TID_DXFILEHeader: TGUID = '{3D82AB43-62DA-11CF-AB39-0020AF71E433}';

{ DirectX File errors. }

const
  DXFILE_OK = 0;

  DXFILEERR_BADOBJECT               = $88760000 or 850;
  DXFILEERR_BADVALUE                = $88760000 or 851;
  DXFILEERR_BADTYPE                 = $88760000 or 852;
  DXFILEERR_BADSTREAMHANDLE         = $88760000 or 853;
  DXFILEERR_BADALLOC                = $88760000 or 854;
  DXFILEERR_NOTFOUND                = $88760000 or 855;
  DXFILEERR_NOTDONEYET              = $88760000 or 856;
  DXFILEERR_FILENOTFOUND            = $88760000 or 857;
  DXFILEERR_RESOURCENOTFOUND        = $88760000 or 858;
  DXFILEERR_URLNOTFOUND             = $88760000 or 859;
  DXFILEERR_BADRESOURCE             = $88760000 or 860;
  DXFILEERR_BADFILETYPE             = $88760000 or 861;
  DXFILEERR_BADFILEVERSION          = $88760000 or 862;
  DXFILEERR_BADFILEFLOATSIZE        = $88760000 or 863;
  DXFILEERR_BADFILECOMPRESSIONTYPE  = $88760000 or 864;
  DXFILEERR_BADFILE                 = $88760000 or 865;
  DXFILEERR_PARSEERROR              = $88760000 or 866;
  DXFILEERR_NOTEMPLATE              = $88760000 or 867;
  DXFILEERR_BADARRAYSIZE            = $88760000 or 868;
  DXFILEERR_BADDATAREFERENCE        = $88760000 or 869;
  DXFILEERR_INTERNALERROR           = $88760000 or 870;
  DXFILEERR_NOMOREOBJECTS           = $88760000 or 871;
  DXFILEERR_BADINTRINSICS           = $88760000 or 872;
  DXFILEERR_NOMORESTREAMHANDLES     = $88760000 or 873;
  DXFILEERR_NOMOREDATA              = $88760000 or 874;
  DXFILEERR_BADCACHEFILE            = $88760000 or 875;
  DXFILEERR_NOINTERNET              = $88760000 or 876;

{ API for creating IDirectXFile interface. }

function DirectXFileCreate(out lplpDirectXFile: IDirectXFile): HResult; stdcall;

(***************************************************************************
 *
 *  Copyright (C) 1998-1999 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       rmxfguid.h
 *
 *  Content:    Defines GUIDs of D3DRM's templates.
 *
 ***************************************************************************)

const
  TID_D3DRMInfo: TGUID = '{2B957100-9E9A-11cf-AB39-0020AF71E433}';
  TID_D3DRMMesh: TGUID = '{3D82AB44-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMVector: TGUID = '{3D82AB5E-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMMeshFace: TGUID = '{3D82AB5F-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMMaterial: TGUID = '{3D82AB4D-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMMaterialArray: TGUID = '{35FF44E1-6C7C-11cf-8F52-0040333594A3}';
  TID_D3DRMFrame: TGUID = '{3D82AB46-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMFrameTransformMatrix: TGUID = '{F6F23F41-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMMeshMaterialList: TGUID = '{F6F23F42-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMMeshTextureCoords: TGUID = '{F6F23F40-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMMeshNormals: TGUID = '{F6F23F43-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMCoords2d: TGUID = '{F6F23F44-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMMatrix4x4: TGUID = '{F6F23F45-7686-11cf-8F52-0040333594A3}';
  TID_D3DRMAnimation: TGUID = '{3D82AB4F-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMAnimationSet: TGUID = '{3D82AB50-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMAnimationKey: TGUID = '{10DD46A8-775B-11cf-8F52-0040333594A3}';
  TID_D3DRMFloatKeys: TGUID = '{10DD46A9-775B-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialAmbientColor: TGUID = '{01411840-7786-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialDiffuseColor: TGUID = '{01411841-7786-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialSpecularColor: TGUID = '{01411842-7786-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialEmissiveColor: TGUID = '{D3E16E80-7835-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialPower: TGUID = '{01411843-7786-11cf-8F52-0040333594A3}';
  TID_D3DRMColorRGBA: TGUID = '{35FF44E0-6C7C-11cf-8F52-0040333594A3}';
  TID_D3DRMColorRGB: TGUID = '{D3E16E81-7835-11cf-8F52-0040333594A3}';
  TID_D3DRMGuid: TGUID = '{A42790E0-7810-11cf-8F52-0040333594A3}';
  TID_D3DRMTextureFilename: TGUID = '{A42790E1-7810-11cf-8F52-0040333594A3}';
  TID_D3DRMTextureReference: TGUID = '{A42790E2-7810-11cf-8F52-0040333594A3}';
  TID_D3DRMIndexedColor: TGUID = '{1630B820-7842-11cf-8F52-0040333594A3}';
  TID_D3DRMMeshVertexColors: TGUID = '{1630B821-7842-11cf-8F52-0040333594A3}';
  TID_D3DRMMaterialWrap: TGUID = '{4885AE60-78E8-11cf-8F52-0040333594A3}';
  TID_D3DRMBoolean: TGUID = '{537DA6A0-CA37-11d0-941C-0080C80CFA7B}';
  TID_D3DRMMeshFaceWraps: TGUID = '{ED1EC5C0-C0A8-11d0-941C-0080C80CFA7B}';
  TID_D3DRMBoolean2d: TGUID = '{4885AE63-78E8-11cf-8F52-0040333594A3}';
  TID_D3DRMTimedFloatKeys: TGUID = '{F406B180-7B3B-11cf-8F52-0040333594A3}';
  TID_D3DRMAnimationOptions: TGUID = '{E2BF56C0-840F-11cf-8F52-0040333594A3}';
  TID_D3DRMFramePosition: TGUID = '{E2BF56C1-840F-11cf-8F52-0040333594A3}';
  TID_D3DRMFrameVelocity: TGUID = '{E2BF56C2-840F-11cf-8F52-0040333594A3}';
  TID_D3DRMFrameRotation: TGUID = '{E2BF56C3-840F-11cf-8F52-0040333594A3}';
  TID_D3DRMLight: TGUID = '{3D82AB4A-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMCamera: TGUID = '{3D82AB51-62DA-11cf-AB39-0020AF71E433}';
  TID_D3DRMAppData: TGUID = '{E5745280-B24F-11cf-9DD5-00AA00A71A2F}';
  TID_D3DRMLightUmbra: TGUID = '{AED22740-B31F-11cf-9DD5-00AA00A71A2F}';
  TID_D3DRMLightRange: TGUID = '{AED22742-B31F-11cf-9DD5-00AA00A71A2F}';
  TID_D3DRMLightPenumbra: TGUID = '{AED22741-B31F-11cf-9DD5-00AA00A71A2F}';
  TID_D3DRMLightAttenuation: TGUID = '{A8A98BA0-C5E5-11cf-B941-0080C80CFA7B}';
  TID_D3DRMInlineData: TGUID = '{3A23EEA0-94B1-11d0-AB39-0020AF71E433}';
  TID_D3DRMUrl: TGUID = '{3A23EEA1-94B1-11d0-AB39-0020AF71E433}';

  TID_D3DRMProgressiveMesh: TGUID = '{8A63C360-997D-11d0-941C-0080C80CFA7B}';
  TID_D3DRMExternalVisual: TGUID = '{98116AA0-BDBA-11d1-82C0-00A0C9697271}';
  TID_D3DRMStringProperty: TGUID = '{7F0F21E0-BFE1-11d1-82C0-00A0C9697271}';
  TID_D3DRMPropertyBag: TGUID = '{7F0F21E1-BFE1-11d1-82C0-00A0C9697271}';
  TID_D3DRMRightHanded: TGUID = '{7F5D5EA0-D53A-11d1-82C0-00A0C9697271}';

(***************************************************************************
 *
 *  Copyright (C) 1998-1999 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       rmxftmpl.h
 *
 *  Content:    D3DRM XFile templates in binary form.
 *
 ***************************************************************************)

const
  D3DRM_XTEMPLATES: array [0..3214] of byte = (
        $78, $6f, $66, $20, $30, $33, $30, $32, $62,
        $69, $6e, $20, $30, $30, $36, $34, $1f, 0, $1,
        0, $6, 0, 0, 0, $48, $65, $61, $64, $65,
        $72, $a, 0, $5, 0, $43, $ab, $82, $3d, $da,
        $62, $cf, $11, $ab, $39, 0, $20, $af, $71, $e4,
        $33, $28, 0, $1, 0, $5, 0, 0, 0, $6d,
        $61, $6a, $6f, $72, $14, 0, $28, 0, $1, 0,
        $5, 0, 0, 0, $6d, $69, $6e, $6f, $72, $14, 
        0, $29, 0, $1, 0, $5, 0, 0, 0, $66, 
        $6c, $61, $67, $73, $14, 0, $b, 0, $1f, 0, 
        $1, 0, $6, 0, 0, 0, $56, $65, $63, $74, 
        $6f, $72, $a, 0, $5, 0, $5e, $ab, $82, $3d, 
        $da, $62, $cf, $11, $ab, $39, 0, $20, $af, $71, 
        $e4, $33, $2a, 0, $1, 0, $1, 0, 0, 0, 
        $78, $14, 0, $2a, 0, $1, 0, $1, 0, 0,
        0, $79, $14, 0, $2a, 0, $1, 0, $1, 0,
        0, 0, $7a, $14, 0, $b, 0, $1f, 0, $1, 
        0, $8, 0, 0, 0, $43, $6f, $6f, $72, $64,
        $73, $32, $64, $a, 0, $5, 0, $44, $3f, $f2, 
        $f6, $86, $76, $cf, $11, $8f, $52, 0, $40, $33, 
        $35, $94, $a3, $2a, 0, $1, 0, $1, 0, 0, 
        0, $75, $14, 0, $2a, 0, $1, 0, $1, 0, 
        0, 0, $76, $14, 0, $b, 0, $1f, 0, $1, 
        0, $9, 0, 0, 0, $4d, $61, $74, $72, $69, 
        $78, $34, $78, $34, $a, 0, $5, 0, $45, $3f, 
        $f2, $f6, $86, $76, $cf, $11, $8f, $52, 0, $40, 
        $33, $35, $94, $a3, $34, 0, $2a, 0, $1, 0, 
        $6, 0, 0, 0, $6d, $61, $74, $72, $69, $78,
        $e, 0, $3, 0, $10, 0, 0, 0, $f, 0, 
        $14, 0, $b, 0, $1f, 0, $1, 0, $9, 0, 
        0, 0, $43, $6f, $6c, $6f, $72, $52, $47, $42, 
        $41, $a, 0, $5, 0, $e0, $44, $ff, $35, $7c, 
        $6c, $cf, $11, $8f, $52, 0, $40, $33, $35, $94, 
        $a3, $2a, 0, $1, 0, $3, 0, 0, 0, $72, 
        $65, $64, $14, 0, $2a, 0, $1, 0, $5, 0, 
        0, 0, $67, $72, $65, $65, $6e, $14, 0, $2a, 
        0, $1, 0, $4, 0, 0, 0, $62, $6c, $75, 
        $65, $14, 0, $2a, 0, $1, 0, $5, 0, 0, 
        0, $61, $6c, $70, $68, $61, $14, 0, $b, 0, 
        $1f, 0, $1, 0, $8, 0, 0, 0, $43, $6f,
        $6c, $6f, $72, $52, $47, $42, $a, 0, $5, 0, 
        $81, $6e, $e1, $d3, $35, $78, $cf, $11, $8f, $52, 
        0, $40, $33, $35, $94, $a3, $2a, 0, $1, 0, 
        $3, 0, 0, 0, $72, $65, $64, $14, 0, $2a,
        0, $1, 0, $5, 0, 0, 0, $67, $72, $65, 
        $65, $6e, $14, 0, $2a, 0, $1, 0, $4, 0, 
        0, 0, $62, $6c, $75, $65, $14, 0, $b, 0, 
        $1f, 0, $1, 0, $c, 0, 0, 0, $49, $6e, 
        $64, $65, $78, $65, $64, $43, $6f, $6c, $6f, $72,
        $a, 0, $5, 0, $20, $b8, $30, $16, $42, $78, 
        $cf, $11, $8f, $52, 0, $40, $33, $35, $94, $a3, 
        $29, 0, $1, 0, $5, 0, 0, 0, $69, $6e, 
        $64, $65, $78, $14, 0, $1, 0, $9, 0, 0, 
        0, $43, $6f, $6c, $6f, $72, $52, $47, $42, $41, 
        $1, 0, $a, 0, 0, 0, $69, $6e, $64, $65, 
        $78, $43, $6f, $6c, $6f, $72, $14, 0, $b, 0, 
        $1f, 0, $1, 0, $7, 0, 0, 0, $42, $6f, 
        $6f, $6c, $65, $61, $6e, $a, 0, $5, 0, $a0, 
        $a6, $7d, $53, $37, $ca, $d0, $11, $94, $1c, 0, 
        $80, $c8, $c, $fa, $7b, $29, 0, $1, 0, $9, 
        0, 0, 0, $74, $72, $75, $65, $66, $61, $6c, 
        $73, $65, $14, 0, $b, 0, $1f, 0, $1, 0, 
        $9, 0, 0, 0, $42, $6f, $6f, $6c, $65, $61, 
        $6e, $32, $64, $a, 0, $5, 0, $63, $ae, $85, 
        $48, $e8, $78, $cf, $11, $8f, $52, 0, $40, $33, 
        $35, $94, $a3, $1, 0, $7, 0, 0, 0, $42, 
        $6f, $6f, $6c, $65, $61, $6e, $1, 0, $1, 0, 
        0, 0, $75, $14, 0, $1, 0, $7, 0, 0, 
        0, $42, $6f, $6f, $6c, $65, $61, $6e, $1, 0, 
        $1, 0, 0, 0, $76, $14, 0, $b, 0, $1f, 
        0, $1, 0, $c, 0, 0, 0, $4d, $61, $74, 
        $65, $72, $69, $61, $6c, $57, $72, $61, $70, $a, 
        0, $5, 0, $60, $ae, $85, $48, $e8, $78, $cf, 
        $11, $8f, $52, 0, $40, $33, $35, $94, $a3, $1, 
        0, $7, 0, 0, 0, $42, $6f, $6f, $6c, $65, 
        $61, $6e, $1, 0, $1, 0, 0, 0, $75, $14,
        0, $1, 0, $7, 0, 0, 0, $42, $6f, $6f,
        $6c, $65, $61, $6e, $1, 0, $1, 0, 0, 0, 
        $76, $14, 0, $b, 0, $1f, 0, $1, 0, $f,
        0, 0, 0, $54, $65, $78, $74, $75, $72, $65,
        $46, $69, $6c, $65, $6e, $61, $6d, $65, $a, 0, 
        $5, 0, $e1, $90, $27, $a4, $10, $78, $cf, $11, 
        $8f, $52, 0, $40, $33, $35, $94, $a3, $31, 0, 
        $1, 0, $8, 0, 0, 0, $66, $69, $6c, $65,
        $6e, $61, $6d, $65, $14, 0, $b, 0, $1f, 0, 
        $1, 0, $8, 0, 0, 0, $4d, $61, $74, $65, 
        $72, $69, $61, $6c, $a, 0, $5, 0, $4d, $ab, 
        $82, $3d, $da, $62, $cf, $11, $ab, $39, 0, $20, 
        $af, $71, $e4, $33, $1, 0, $9, 0, 0, 0, 
        $43, $6f, $6c, $6f, $72, $52, $47, $42, $41, $1, 
        0, $9, 0, 0, 0, $66, $61, $63, $65, $43, 
        $6f, $6c, $6f, $72, $14, 0, $2a, 0, $1, 0, 
        $5, 0, 0, 0, $70, $6f, $77, $65, $72, $14, 
        0, $1, 0, $8, 0, 0, 0, $43, $6f, $6c, 
        $6f, $72, $52, $47, $42, $1, 0, $d, 0, 0, 
        0, $73, $70, $65, $63, $75, $6c, $61, $72, $43, 
        $6f, $6c, $6f, $72, $14, 0, $1, 0, $8, 0, 
        0, 0, $43, $6f, $6c, $6f, $72, $52, $47, $42, 
        $1, 0, $d, 0, 0, 0, $65, $6d, $69, $73, 
        $73, $69, $76, $65, $43, $6f, $6c, $6f, $72, $14, 
        0, $e, 0, $12, 0, $12, 0, $12, 0, $f, 
        0, $b, 0, $1f, 0, $1, 0, $8, 0, 0, 
        0, $4d, $65, $73, $68, $46, $61, $63, $65, $a, 
        0, $5, 0, $5f, $ab, $82, $3d, $da, $62, $cf, 
        $11, $ab, $39, 0, $20, $af, $71, $e4, $33, $29, 
        0, $1, 0, $12, 0, 0, 0, $6e, $46, $61, 
        $63, $65, $56, $65, $72, $74, $65, $78, $49, $6e, 
        $64, $69, $63, $65, $73, $14, 0, $34, 0, $29, 
        0, $1, 0, $11, 0, 0, 0, $66, $61, $63, 
        $65, $56, $65, $72, $74, $65, $78, $49, $6e, $64,
        $69, $63, $65, $73, $e, 0, $1, 0, $12, 0, 
        0, 0, $6e, $46, $61, $63, $65, $56, $65, $72, 
        $74, $65, $78, $49, $6e, $64, $69, $63, $65, $73, 
        $f, 0, $14, 0, $b, 0, $1f, 0, $1, 0,
        $d, 0, 0, 0, $4d, $65, $73, $68, $46, $61, 
        $63, $65, $57, $72, $61, $70, $73, $a, 0, $5, 
        0, $c0, $c5, $1e, $ed, $a8, $c0, $d0, $11, $94, 
        $1c, 0, $80, $c8, $c, $fa, $7b, $29, 0, $1, 
        0, $f, 0, 0, 0, $6e, $46, $61, $63, $65, 
        $57, $72, $61, $70, $56, $61, $6c, $75, $65, $73,
        $14, 0, $34, 0, $1, 0, $9, 0, 0, 0, 
        $42, $6f, $6f, $6c, $65, $61, $6e, $32, $64, $1, 
        0, $e, 0, 0, 0, $66, $61, $63, $65, $57, 
        $72, $61, $70, $56, $61, $6c, $75, $65, $73, $e,
        0, $1, 0, $f, 0, 0, 0, $6e, $46, $61, 
        $63, $65, $57, $72, $61, $70, $56, $61, $6c, $75, 
        $65, $73, $f, 0, $14, 0, $b, 0, $1f, 0, 
        $1, 0, $11, 0, 0, 0, $4d, $65, $73, $68, 
        $54, $65, $78, $74, $75, $72, $65, $43, $6f, $6f, 
        $72, $64, $73, $a, 0, $5, 0, $40, $3f, $f2, 
        $f6, $86, $76, $cf, $11, $8f, $52, 0, $40, $33, 
        $35, $94, $a3, $29, 0, $1, 0, $e, 0, 0, 
        0, $6e, $54, $65, $78, $74, $75, $72, $65, $43, 
        $6f, $6f, $72, $64, $73, $14, 0, $34, 0, $1, 
        0, $8, 0, 0, 0, $43, $6f, $6f, $72, $64, 
        $73, $32, $64, $1, 0, $d, 0, 0, 0, $74, 
        $65, $78, $74, $75, $72, $65, $43, $6f, $6f, $72, 
        $64, $73, $e, 0, $1, 0, $e, 0, 0, 0, 
        $6e, $54, $65, $78, $74, $75, $72, $65, $43, $6f, 
        $6f, $72, $64, $73, $f, 0, $14, 0, $b, 0,
        $1f, 0, $1, 0, $10, 0, 0, 0, $4d, $65, 
        $73, $68, $4d, $61, $74, $65, $72, $69, $61, $6c, 
        $4c, $69, $73, $74, $a, 0, $5, 0, $42, $3f, 
        $f2, $f6, $86, $76, $cf, $11, $8f, $52, 0, $40, 
        $33, $35, $94, $a3, $29, 0, $1, 0, $a, 0, 
        0, 0, $6e, $4d, $61, $74, $65, $72, $69, $61, 
        $6c, $73, $14, 0, $29, 0, $1, 0, $c, 0, 
        0, 0, $6e, $46, $61, $63, $65, $49, $6e, $64, 
        $65, $78, $65, $73, $14, 0, $34, 0, $29, 0, 
        $1, 0, $b, 0, 0, 0, $66, $61, $63, $65, 
        $49, $6e, $64, $65, $78, $65, $73, $e, 0, $1,
        0, $c, 0, 0, 0, $6e, $46, $61, $63, $65, 
        $49, $6e, $64, $65, $78, $65, $73, $f, 0, $14, 
        0, $e, 0, $1, 0, $8, 0, 0, 0, $4d, 
        $61, $74, $65, $72, $69, $61, $6c, $f, 0, $b, 
        0, $1f, 0, $1, 0, $b, 0, 0, 0, $4d, 
        $65, $73, $68, $4e, $6f, $72, $6d, $61, $6c, $73, 
        $a, 0, $5, 0, $43, $3f, $f2, $f6, $86, $76, 
        $cf, $11, $8f, $52, 0, $40, $33, $35, $94, $a3, 
        $29, 0, $1, 0, $8, 0, 0, 0, $6e, $4e,
        $6f, $72, $6d, $61, $6c, $73, $14, 0, $34, 0, 
        $1, 0, $6, 0, 0, 0, $56, $65, $63, $74, 
        $6f, $72, $1, 0, $7, 0, 0, 0, $6e, $6f, 
        $72, $6d, $61, $6c, $73, $e, 0, $1, 0, $8,
        0, 0, 0, $6e, $4e, $6f, $72, $6d, $61, $6c, 
        $73, $f, 0, $14, 0, $29, 0, $1, 0, $c, 
        0, 0, 0, $6e, $46, $61, $63, $65, $4e, $6f, 
        $72, $6d, $61, $6c, $73, $14, 0, $34, 0, $1, 
        0, $8, 0, 0, 0, $4d, $65, $73, $68, $46, 
        $61, $63, $65, $1, 0, $b, 0, 0, 0, $66, 
        $61, $63, $65, $4e, $6f, $72, $6d, $61, $6c, $73,
        $e, 0, $1, 0, $c, 0, 0, 0, $6e, $46, 
        $61, $63, $65, $4e, $6f, $72, $6d, $61, $6c, $73, 
        $f, 0, $14, 0, $b, 0, $1f, 0, $1, 0, 
        $10, 0, 0, 0, $4d, $65, $73, $68, $56, $65, 
        $72, $74, $65, $78, $43, $6f, $6c, $6f, $72, $73, 
        $a, 0, $5, 0, $21, $b8, $30, $16, $42, $78, 
        $cf, $11, $8f, $52, 0, $40, $33, $35, $94, $a3, 
        $29, 0, $1, 0, $d, 0, 0, 0, $6e, $56, 
        $65, $72, $74, $65, $78, $43, $6f, $6c, $6f, $72, 
        $73, $14, 0, $34, 0, $1, 0, $c, 0, 0, 
        0, $49, $6e, $64, $65, $78, $65, $64, $43, $6f, 
        $6c, $6f, $72, $1, 0, $c, 0, 0, 0, $76, 
        $65, $72, $74, $65, $78, $43, $6f, $6c, $6f, $72, 
        $73, $e, 0, $1, 0, $d, 0, 0, 0, $6e, 
        $56, $65, $72, $74, $65, $78, $43, $6f, $6c, $6f, 
        $72, $73, $f, 0, $14, 0, $b, 0, $1f, 0, 
        $1, 0, $4, 0, 0, 0, $4d, $65, $73, $68,
        $a, 0, $5, 0, $44, $ab, $82, $3d, $da, $62, 
        $cf, $11, $ab, $39, 0, $20, $af, $71, $e4, $33, 
        $29, 0, $1, 0, $9, 0, 0, 0, $6e, $56, 
        $65, $72, $74, $69, $63, $65, $73, $14, 0, $34, 
        0, $1, 0, $6, 0, 0, 0, $56, $65, $63, 
        $74, $6f, $72, $1, 0, $8, 0, 0, 0, $76, 
        $65, $72, $74, $69, $63, $65, $73, $e, 0, $1, 
        0, $9, 0, 0, 0, $6e, $56, $65, $72, $74, 
        $69, $63, $65, $73, $f, 0, $14, 0, $29, 0, 
        $1, 0, $6, 0, 0, 0, $6e, $46, $61, $63, 
        $65, $73, $14, 0, $34, 0, $1, 0, $8, 0, 
        0, 0, $4d, $65, $73, $68, $46, $61, $63, $65,
        $1, 0, $5, 0, 0, 0, $66, $61, $63, $65,
        $73, $e, 0, $1, 0, $6, 0, 0, 0, $6e, 
        $46, $61, $63, $65, $73, $f, 0, $14, 0, $e, 
        0, $12, 0, $12, 0, $12, 0, $f, 0, $b,
        0, $1f, 0, $1, 0, $14, 0, 0, 0, $46, 
        $72, $61, $6d, $65, $54, $72, $61, $6e, $73, $66, 
        $6f, $72, $6d, $4d, $61, $74, $72, $69, $78, $a, 
        0, $5, 0, $41, $3f, $f2, $f6, $86, $76, $cf, 
        $11, $8f, $52, 0, $40, $33, $35, $94, $a3, $1, 
        0, $9, 0, 0, 0, $4d, $61, $74, $72, $69, 
        $78, $34, $78, $34, $1, 0, $b, 0, 0, 0, 
        $66, $72, $61, $6d, $65, $4d, $61, $74, $72, $69, 
        $78, $14, 0, $b, 0, $1f, 0, $1, 0, $5, 
        0, 0, 0, $46, $72, $61, $6d, $65, $a, 0, 
        $5, 0, $46, $ab, $82, $3d, $da, $62, $cf, $11, 
        $ab, $39, 0, $20, $af, $71, $e4, $33, $e, 0, 
        $12, 0, $12, 0, $12, 0, $f, 0, $b, 0, 
        $1f, 0, $1, 0, $9, 0, 0, 0, $46, $6c, 
        $6f, $61, $74, $4b, $65, $79, $73, $a, 0, $5, 
        0, $a9, $46, $dd, $10, $5b, $77, $cf, $11, $8f, 
        $52, 0, $40, $33, $35, $94, $a3, $29, 0, $1, 
        0, $7, 0, 0, 0, $6e, $56, $61, $6c, $75, 
        $65, $73, $14, 0, $34, 0, $2a, 0, $1, 0, 
        $6, 0, 0, 0, $76, $61, $6c, $75, $65, $73, 
        $e, 0, $1, 0, $7, 0, 0, 0, $6e, $56,
        $61, $6c, $75, $65, $73, $f, 0, $14, 0, $b, 
        0, $1f, 0, $1, 0, $e, 0, 0, 0, $54, 
        $69, $6d, $65, $64, $46, $6c, $6f, $61, $74, $4b, 
        $65, $79, $73, $a, 0, $5, 0, $80, $b1, $6, 
        $f4, $3b, $7b, $cf, $11, $8f, $52, 0, $40, $33, 
        $35, $94, $a3, $29, 0, $1, 0, $4, 0, 0, 
        0, $74, $69, $6d, $65, $14, 0, $1, 0, $9,
        0, 0, 0, $46, $6c, $6f, $61, $74, $4b, $65, 
        $79, $73, $1, 0, $6, 0, 0, 0, $74, $66, 
        $6b, $65, $79, $73, $14, 0, $b, 0, $1f, 0, 
        $1, 0, $c, 0, 0, 0, $41, $6e, $69, $6d, 
        $61, $74, $69, $6f, $6e, $4b, $65, $79, $a, 0, 
        $5, 0, $a8, $46, $dd, $10, $5b, $77, $cf, $11, 
        $8f, $52, 0, $40, $33, $35, $94, $a3, $29, 0, 
        $1, 0, $7, 0, 0, 0, $6b, $65, $79, $54,
        $79, $70, $65, $14, 0, $29, 0, $1, 0, $5, 
        0, 0, 0, $6e, $4b, $65, $79, $73, $14, 0, 
        $34, 0, $1, 0, $e, 0, 0, 0, $54, $69, 
        $6d, $65, $64, $46, $6c, $6f, $61, $74, $4b, $65,
        $79, $73, $1, 0, $4, 0, 0, 0, $6b, $65, 
        $79, $73, $e, 0, $1, 0, $5, 0, 0, 0, 
        $6e, $4b, $65, $79, $73, $f, 0, $14, 0, $b, 
        0, $1f, 0, $1, 0, $10, 0, 0, 0, $41, 
        $6e, $69, $6d, $61, $74, $69, $6f, $6e, $4f, $70, 
        $74, $69, $6f, $6e, $73, $a, 0, $5, 0, $c0, 
        $56, $bf, $e2, $f, $84, $cf, $11, $8f, $52, 0, 
        $40, $33, $35, $94, $a3, $29, 0, $1, 0, $a, 
        0, 0, 0, $6f, $70, $65, $6e, $63, $6c, $6f, 
        $73, $65, $64, $14, 0, $29, 0, $1, 0, $f, 
        0, 0, 0, $70, $6f, $73, $69, $74, $69, $6f, 
        $6e, $71, $75, $61, $6c, $69, $74, $79, $14, 0, 
        $b, 0, $1f, 0, $1, 0, $9, 0, 0, 0, 
        $41, $6e, $69, $6d, $61, $74, $69, $6f, $6e, $a, 
        0, $5, 0, $4f, $ab, $82, $3d, $da, $62, $cf, 
        $11, $ab, $39, 0, $20, $af, $71, $e4, $33, $e, 
        0, $12, 0, $12, 0, $12, 0, $f, 0, $b, 
        0, $1f, 0, $1, 0, $c, 0, 0, 0, $41,
        $6e, $69, $6d, $61, $74, $69, $6f, $6e, $53, $65, 
        $74, $a, 0, $5, 0, $50, $ab, $82, $3d, $da, 
        $62, $cf, $11, $ab, $39, 0, $20, $af, $71, $e4, 
        $33, $e, 0, $1, 0, $9, 0, 0, 0, $41, 
        $6e, $69, $6d, $61, $74, $69, $6f, $6e, $f, 0, 
        $b, 0, $1f, 0, $1, 0, $a, 0, 0, 0, 
        $49, $6e, $6c, $69, $6e, $65, $44, $61, $74, $61, 
        $a, 0, $5, 0, $a0, $ee, $23, $3a, $b1, $94, 
        $d0, $11, $ab, $39, 0, $20, $af, $71, $e4, $33, 
        $e, 0, $1, 0, $6, 0, 0, 0, $42, $49, 
        $4e, $41, $52, $59, $f, 0, $b, 0, $1f, 0, 
        $1, 0, $3, 0, 0, 0, $55, $72, $6c, $a, 
        0, $5, 0, $a1, $ee, $23, $3a, $b1, $94, $d0, 
        $11, $ab, $39, 0, $20, $af, $71, $e4, $33, $29, 
        0, $1, 0, $5, 0, 0, 0, $6e, $55, $72, 
        $6c, $73, $14, 0, $34, 0, $31, 0, $1, 0, 
        $4, 0, 0, 0, $75, $72, $6c, $73, $e, 0, 
        $1, 0, $5, 0, 0, 0, $6e, $55, $72, $6c,
        $73, $f, 0, $14, 0, $b, 0, $1f, 0, $1, 
        0, $f, 0, 0, 0, $50, $72, $6f, $67, $72, 
        $65, $73, $73, $69, $76, $65, $4d, $65, $73, $68, 
        $a, 0, $5, 0, $60, $c3, $63, $8a, $7d, $99,
        $d0, $11, $94, $1c, 0, $80, $c8, $c, $fa, $7b, 
        $e, 0, $1, 0, $3, 0, 0, 0, $55, $72, 
        $6c, $13, 0, $1, 0, $a, 0, 0, 0, $49, 
        $6e, $6c, $69, $6e, $65, $44, $61, $74, $61, $f, 
        0, $b, 0, $1f, 0, $1, 0, $4, 0, 0, 
        0, $47, $75, $69, $64, $a, 0, $5, 0, $e0, 
        $90, $27, $a4, $10, $78, $cf, $11, $8f, $52, 0, 
        $40, $33, $35, $94, $a3, $29, 0, $1, 0, $5, 
        0, 0, 0, $64, $61, $74, $61, $31, $14, 0,
        $28, 0, $1, 0, $5, 0, 0, 0, $64, $61, 
        $74, $61, $32, $14, 0, $28, 0, $1, 0, $5, 
        0, 0, 0, $64, $61, $74, $61, $33, $14, 0, 
        $34, 0, $2d, 0, $1, 0, $5, 0, 0, 0, 
        $64, $61, $74, $61, $34, $e, 0, $3, 0, $8, 
        0, 0, 0, $f, 0, $14, 0, $b, 0, $1f,
        0, $1, 0, $e, 0, 0, 0, $53, $74, $72,
        $69, $6e, $67, $50, $72, $6f, $70, $65, $72, $74,
        $79, $a, 0, $5, 0, $e0, $21, $f, $7f, $e1,
        $bf, $d1, $11, $82, $c0, 0, $a0, $c9, $69, $72,
        $71, $31, 0, $1, 0, $3, 0, 0, 0, $6b,
        $65, $79, $14, 0, $31, 0, $1, 0, $5, 0,
        0, 0, $76, $61, $6c, $75, $65, $14, 0, $b,
        0, $1f, 0, $1, 0, $b, 0, 0, 0, $50,
        $72, $6f, $70, $65, $72, $74, $79, $42, $61, $67,
        $a, 0, $5, 0, $e1, $21, $f, $7f, $e1, $bf,
        $d1, $11, $82, $c0, 0, $a0, $c9, $69, $72, $71,
        $e, 0, $1, 0, $e, 0, 0, 0, $53, $74,
        $72, $69, $6e, $67, $50, $72, $6f, $70, $65, $72,
        $74, $79, $f, 0, $b, 0, $1f, 0, $1, 0,
        $e, 0, 0, 0, $45, $78, $74, $65, $72, $6e,
        $61, $6c, $56, $69, $73, $75, $61, $6c, $a, 0,
        $5, 0, $a0, $6a, $11, $98, $ba, $bd, $d1, $11,
        $82, $c0, 0, $a0, $c9, $69, $72, $71, $1, 0,
        $4, 0, 0, 0, $47, $75, $69, $64, $1, 0,
        $12, 0, 0, 0, $67, $75, $69, $64, $45, $78,
        $74, $65, $72, $6e, $61, $6c, $56, $69, $73, $75,
        $61, $6c, $14, 0, $e, 0, $12, 0, $12, 0,
        $12, 0, $f, 0, $b, 0);

(*==========================================================================;
 *
 *  Copyright (C) 1996-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dinput.h
 *  Content:    DirectInput include file
 *
 ****************************************************************************)

const
{$IFDEF DirectX3}
  DIRECTINPUT_VERSION = $0300;
{$ENDIF}{$IFDEF DirectX5}
  DIRECTINPUT_VERSION = $0500;
{$ENDIF}{$IFDEF DirectX6}
  DIRECTINPUT_VERSION = $0500;
{$ENDIF

{ Class IDs }

const
  CLSID_DirectInput: TGUID = '{25E609E0-B259-11CF-BFC7-444553540000}';
  CLSID_DirectInputDevice: TGUID = '{25E609E1-B259-11CF-BFC7-444553540000}';

{ Interfaces }

const
  IID_IDirectInputA: TGUID = '{89521360-AA8A-11CF-BFC7-444553540000}';
  IID_IDirectInputW: TGUID = '{89521361-AA8A-11CF-BFC7-444553540000}';
  IID_IDirectInput2A: TGUID = '{5944E662-AA8A-11CF-BFC7-444553540000}';
  IID_IDirectInput2W: TGUID = '{5944E663-AA8A-11CF-BFC7-444553540000}';
  IID_IDirectInputDeviceA: TGUID = '{5944E680-C92E-11CF-BFC7-444553540000}';
  IID_IDirectInputDeviceW: TGUID = '{5944E681-C92E-11CF-BFC7-444553540000}';
  IID_IDirectInputDevice2A: TGUID = '{5944E682-C92E-11CF-BFC7-444553540000}';
  IID_IDirectInputDevice2W: TGUID = '{5944E683-C92E-11CF-BFC7-444553540000}';
  IID_IDirectInputEffect: TGUID = '{E7E1F7C0-88D2-11D0-9AD0-00A0C9A06E35}';

{ Predefined object types }

  GUID_XAxis: TGUID = '{A36D02E0-C9F3-11CF-BFC7-444553540000}';
  GUID_YAxis: TGUID = '{A36D02E1-C9F3-11CF-BFC7-444553540000}';
  GUID_ZAxis: TGUID = '{A36D02E2-C9F3-11CF-BFC7-444553540000}';
  GUID_RxAxis: TGUID = '{A36D02F4-C9F3-11CF-BFC7-444553540000}';
  GUID_RyAxis: TGUID = '{A36D02F5-C9F3-11CF-BFC7-444553540000}';
  GUID_RzAxis: TGUID = '{A36D02E3-C9F3-11CF-BFC7-444553540000}';
  GUID_Slider: TGUID = '{A36D02E4-C9F3-11CF-BFC7-444553540000}';
  GUID_Button: TGUID = '{A36D02F0-C9F3-11CF-BFC7-444553540000}';
  GUID_Key: TGUID = '{55728220-D33C-11CF-BFC7-444553540000}';
  GUID_POV: TGUID = '{A36D02F2-C9F3-11CF-BFC7-444553540000}';
  GUID_Unknown: TGUID = '{A36D02F3-C9F3-11CF-BFC7-444553540000}';

{ Predefined product GUIDs }

  GUID_SysMouse: TGUID = '{6F1D2B60-D5A0-11CF-BFC7-444553540000}';
  GUID_SysKeyboard: TGUID = '{6F1D2B61-D5A0-11CF-BFC7-444553540000}';
  GUID_Joystick: TGUID = '{6F1D2B70-D5A0-11CF-BFC7-444553540000}';

{ Predefined force feedback effects }

  GUID_ConstantForce: TGUID = '{13541C20-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_RampForce: TGUID = '{13541C21-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Square: TGUID = '{13541C22-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Sine: TGUID = '{13541C23-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Triangle: TGUID = '{13541C24-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_SawtoothUp: TGUID = '{13541C25-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_SawtoothDown: TGUID = '{13541C26-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Spring: TGUID = '{13541C27-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Damper: TGUID = '{13541C28-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Inertia: TGUID = '{13541C29-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_Friction: TGUID = '{13541C2A-8E33-11D0-9AD0-00A0C9A06E35}';
  GUID_CustomForce: TGUID = '{13541C2B-8E33-11D0-9AD0-00A0C9A06E35}';

{ IDirectInputEffect }

const
  DIEFT_ALL                = $00000000;

  DIEFT_CONSTANTFORCE      = $00000001;
  DIEFT_RAMPFORCE          = $00000002;
  DIEFT_PERIODIC           = $00000003;
  DIEFT_CONDITION          = $00000004;
  DIEFT_CUSTOMFORCE        = $00000005;
  DIEFT_HARDWARE           = $000000FF;

  DIEFT_FFATTACK           = $00000200;
  DIEFT_FFFADE             = $00000400;
  DIEFT_SATURATION         = $00000800;
  DIEFT_POSNEGCOEFFICIENTS = $00001000;
  DIEFT_POSNEGSATURATION   = $00002000;
  DIEFT_DEADBAND           = $00004000;

function DIEFT_GETTYPE(n: DWORD): DWORD;

const
  DI_DEGREES               = 100;
  DI_FFNOMINALMAX          = 10000;
  DI_SECONDS               = 1000000;

type
  PDIConstantForce = ^TDIConstantForce;
  TDIConstantForce = record
    lMagnitude: Longint;
  end;

  DICONSTANTFORCE = TDIConstantForce;
  LPDICONSTANTFORCE = PDIConstantForce;

  PDIRampForce = ^TDIRampForce;
  TDIRampForce = record
    lStart: Longint;
    lEnd: Longint;
  end;

  DIRAMPFORCE = TDIRampForce;
  LPDIRAMPFORCE = PDIRampForce;

  PDIPeriodic = ^TDIPeriodic;
  TDIPeriodic = record
    dwMagnitude: DWORD;
    lOffset: Longint;
    dwPhase: DWORD;
    dwPeriod: DWORD;
  end;

  DIPERIODIC = TDIPeriodic;
  LPDIPERIODIC = PDIPeriodic;

  PDICondition = ^TDICondition;
  TDICondition = record
    lOffset: Longint;
    lPositiveCoefficient: Longint;
    lNegativeCoefficient: Longint;
    dwPositiveSaturation: DWORD;
    dwNegativeSaturation: DWORD;
    lDeadBand: Longint;
  end;

  DICONDITION = TDICondition;
  LPDICONDITION = PDICondition;

  PDICustomForce = ^TDICustomForce;
  TDICustomForce = record
    cChannels: DWORD;
    dwSamplePeriod: DWORD;
    cSamples: DWORD;
    rglForceData: PLongint;
  end;

  DICUSTOMFORCE = TDICustomForce;
  LPDICUSTOMFORCE = PDICustomForce;

  PDIEnvelope = ^TDIEnvelope;
  TDIEnvelope = record
    dwSize: DWORD;                   // sizeof(DIENVELOPE)
    dwAttackLevel: DWORD;
    dwAttackTime: DWORD;             // Microseconds
    dwFadeLevel: DWORD;
    dwFadeTime: DWORD;               // Microseconds
  end;

  DIENVELOPE = TDIEnvelope;
  LPDIENVELOPE = PDIEnvelope;

  PDIEffect = ^TDIEffect;
  TDIEffect = record
    dwSize: DWORD;                   // sizeof(DIEFFECT)
    dwFlags: DWORD;                  // DIEFF_*
    dwDuration: DWORD;               // Microseconds
    dwSamplePeriod: DWORD;           // Microseconds
    dwGain: DWORD;
    dwTriggerButton: DWORD;          // or DIEB_NOTRIGGER
    dwTriggerRepeatInterval: DWORD;  // Microseconds
    cAxes: DWORD;                    // Number of axes
    rgdwAxes: PDWORD;                // arrayof axes
    rglDirection: PLongint;          // arrayof directions
    lpEnvelope: PDIEnvelope;         // Optional
    cbTypeSpecificParams: DWORD;     // Size of params
    lpvTypeSpecificParams: Pointer;  // Pointer to params
  end;

  DIEFFECT = TDIEffect;
  LPDIEFFECT = PDIEffect;

const
  DIEFF_OBJECTIDS             = $00000001;
  DIEFF_OBJECTOFFSETS         = $00000002;
  DIEFF_CARTESIAN             = $00000010;
  DIEFF_POLAR                 = $00000020;
  DIEFF_SPHERICAL             = $00000040;

  DIEP_DURATION               = $00000001;
  DIEP_SAMPLEPERIOD           = $00000002;
  DIEP_GAIN = $00000004;
  DIEP_TRIGGERBUTTON          = $00000008;
  DIEP_TRIGGERREPEATINTERVAL  = $00000010;
  DIEP_AXES                   = $00000020;
  DIEP_DIRECTION              = $00000040;
  DIEP_ENVELOPE               = $00000080;
  DIEP_TYPESPECIFICPARAMS     = $00000100;
  DIEP_ALLPARAMS              = $000001FF;
  DIEP_START                  = $20000000;
  DIEP_NORESTART              = $40000000;
  DIEP_NODOWNLOAD             = $80000000;
  DIEB_NOTRIGGER              = $FFFFFFFF;

  DIES_SOLO                   = $00000001;
  DIES_NODOWNLOAD             = $80000000;

  DIEGES_PLAYING              = $00000001;
  DIEGES_EMULATED             = $00000002;

type
  PDIEffEscape = ^TDIEffEscape;
  TDIEffEscape = record
    dwSize: DWORD;
    dwCommand: DWORD;
    lpvInBuffer: Pointer;
    cbInBuffer: DWORD;
    lpvOutBuffer: Pointer;
    cbOutBuffer: DWORD;
  end;

  DIEFFESCAPE = TDIEffEscape;
  LPDIEFFESCAPE = PDIEffEscape;

  IDirectInputEffect = interface(IUnknown)
    ['{E7E1F7C0-88D2-11D0-9AD0-00A0C9A06E35}']
    // IDirectInputEffect methods
    function Initialize(hinst: THandle; dwVersion: DWORD; const rguid: TGUID): HResult; stdcall;
    function GetEffectGuid(var pguid: TGUID): HResult; stdcall;
    function GetParameters(var peff: TDIEffect; dwFlags: DWORD): HResult; stdcall;
    function SetParameters(const peff: TDIEffect; dwFlags: DWORD): HResult; stdcall;
    function Start(dwIterations: DWORD; dwFlags: DWORD): HResult; stdcall;
    function Stop: HResult; stdcall;
    function GetEffectStatus(var pdwFlags: DWORD): HResult; stdcall;
    function DownLoad: HResult; stdcall;
    function Unload: HResult; stdcall;
    function Escape(const pesc: TDIEffEscape): HResult; stdcall;
  end;

{ IDirectInputDevice }

const
  DIDEVTYPE_DEVICE   = 1;
  DIDEVTYPE_MOUSE    = 2;
  DIDEVTYPE_KEYBOARD = 3;
  DIDEVTYPE_JOYSTICK = 4;
  DIDEVTYPE_HID      = $00010000;

  DIDEVTYPEMOUSE_UNKNOWN     = 1;
  DIDEVTYPEMOUSE_TRADITIONAL = 2;
  DIDEVTYPEMOUSE_FINGERSTICK = 3;
  DIDEVTYPEMOUSE_TOUCHPAD    = 4;
  DIDEVTYPEMOUSE_TRACKBALL   = 5;

  DIDEVTYPEKEYBOARD_UNKNOWN     = 0;
  DIDEVTYPEKEYBOARD_PCXT        = 1;
  DIDEVTYPEKEYBOARD_OLIVETTI    = 2;
  DIDEVTYPEKEYBOARD_PCAT        = 3;
  DIDEVTYPEKEYBOARD_PCENH       = 4;
  DIDEVTYPEKEYBOARD_NOKIA1050   = 5;
  DIDEVTYPEKEYBOARD_NOKIA9140   = 6;
  DIDEVTYPEKEYBOARD_NEC98       = 7;
  DIDEVTYPEKEYBOARD_NEC98LAPTOP = 8;
  DIDEVTYPEKEYBOARD_NEC98106    = 9;
  DIDEVTYPEKEYBOARD_JAPAN106    = 10;
  DIDEVTYPEKEYBOARD_JAPANAX     = 11;
  DIDEVTYPEKEYBOARD_J3100       = 12;

  DIDEVTYPEJOYSTICK_UNKNOWN     = 1;
  DIDEVTYPEJOYSTICK_TRADITIONAL = 2;
  DIDEVTYPEJOYSTICK_FLIGHTSTICK = 3;
  DIDEVTYPEJOYSTICK_GAMEPAD     = 4;
  DIDEVTYPEJOYSTICK_RUDDER      = 5;
  DIDEVTYPEJOYSTICK_WHEEL       = 6;
  DIDEVTYPEJOYSTICK_HEADTRACKER = 7;

function GET_DIDEVICE_TYPE(dwDevType: DWORD): DWORD;
function GET_DIDEVICE_SUBTYPE(dwDevType: DWORD): DWORD;

type
  PDIDevCaps_DX3 = ^TDIDevCaps_DX3;
  TDIDevCaps_DX3 = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwDevType: DWORD;
    dwAxes: DWORD;
    dwButtons: DWORD;
    dwPOVs: DWORD;
  end;

  PDIDevCaps_DX5 = ^TDIDevCaps_DX5;
  TDIDevCaps_DX5 = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwDevType: DWORD;
    dwAxes: DWORD;
    dwButtons: DWORD;
    dwPOVs: DWORD;
    dwFFSamplePeriod: DWORD;
    dwFFMinTimeResolution: DWORD;
    dwFirmwareRevision: DWORD;
    dwHardwareRevision: DWORD;
    dwFFDriverVersion: DWORD;
  end;

{$IFDEF DirectX3}
  TDIDevCaps = TDIDevCaps_DX3;
  PDIDevCaps = PDIDevCaps_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDIDevCaps = TDIDevCaps_DX5;
  PDIDevCaps = PDIDevCaps_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDIDevCaps = TDIDevCaps_DX5;
  PDIDevCaps = PDIDevCaps_DX5;
{$ENDIF}

  DIDEVCAPS = TDIDevCaps;
  LPDIDEVCAPS = PDIDevCaps;

const
  DIDC_ATTACHED           = $00000001;
  DIDC_POLLEDDEVICE       = $00000002;
  DIDC_EMULATED           = $00000004;
  DIDC_POLLEDDATAFORMAT   = $00000008;

  DIDC_FORCEFEEDBACK      = $00000100;
  DIDC_FFATTACK           = $00000200;
  DIDC_FFFADE             = $00000400;
  DIDC_SATURATION         = $00000800;
  DIDC_POSNEGCOEFFICIENTS = $00001000;
  DIDC_POSNEGSATURATION   = $00002000;
  DIDC_DEADBAND           = $00004000;

  DIDFT_ALL        = $00000000;

  DIDFT_RELAXIS    = $00000001;
  DIDFT_ABSAXIS    = $00000002;
  DIDFT_AXIS       = $00000003;

  DIDFT_PSHBUTTON  = $00000004;
  DIDFT_TGLBUTTON  = $00000008;
  DIDFT_BUTTON     = $0000000C;

  DIDFT_POV        = $00000010;

  DIDFT_COLLECTION = $00000040;
  DIDFT_NODATA     = $00000080;

  DIDFT_ANYINSTANCE = $00FFFF00;
  DIDFT_INSTANCEMASK = DIDFT_ANYINSTANCE;

function DIDFT_MAKEINSTANCE(n: WORD): DWORD;
function DIDFT_GETTYPE(n: DWORD): DWORD;
function DIDFT_GETINSTANCE(n: DWORD): WORD;

const
  DIDFT_FFACTUATOR = $01000000;
  DIDFT_FFEFFECTTRIGGER = $02000000;

function DIDFT_ENUMCOLLECTION(n: WORD): DWORD;

const
  DIDFT_NOCOLLECTION = $00FFFF00;

type
  PDIObjectDataFormat = ^TDIObjectDataFormat;
  TDIObjectDataFormat = record
    pguid: PGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
  end;

  DIOBJECTDATAFORMAT = TDIObjectDataFormat;
  LPDIOBJECTDATAFORMAT = PDIObjectDataFormat;

  PDIDataFormat = ^TDIDataFormat;
  TDIDataFormat = record
    dwSize: DWORD;
    dwObjSize: DWORD;
    dwFlags: DWORD;
    dwDataSize: DWORD;
    dwNumObjs: DWORD;
    rgodf: PDIObjectDataFormat;
  end;

  DIDATAFORMAT = TDIDataFormat;
  LPDIDATAFORMAT = PDIDataFormat;

const
  DIDF_ABSAXIS = $00000001;
  DIDF_RELAXIS = $00000002;

type
  PDIDeviceObjectInstanceA_DX3 = ^TDIDeviceObjectInstanceA_DX3;
  TDIDeviceObjectInstanceA_DX3 = record
    dwSize: DWORD;
    guidType: TGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    tszName: array[0..MAX_PATH-1] of CHAR;
  end;

  PDIDeviceObjectInstanceA_DX5 = ^TDIDeviceObjectInstanceA_DX5;
  TDIDeviceObjectInstanceA_DX5 = record
    dwSize: DWORD;
    guidType: TGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    tszName: array[0..MAX_PATH-1] of CHAR;
    dwFFMaxForce: DWORD;
    dwFFForceResolution: DWORD;
    wCollectionNumber: WORD;
    wDesignatorIndex: WORD;
    wUsagePage: WORD;
    wUsage: WORD;
    dwDimension: DWORD;
    wExponent: WORD;
    wReserved: WORD;
  end;

{$IFDEF DirectX3}
  TDIDeviceObjectInstanceA = TDIDeviceObjectInstanceA_DX3;
  PDIDeviceObjectInstanceA = PDIDeviceObjectInstanceA_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDIDeviceObjectInstanceA = TDIDeviceObjectInstanceA_DX5;
  PDIDeviceObjectInstanceA = PDIDeviceObjectInstanceA_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDIDeviceObjectInstanceA = TDIDeviceObjectInstanceA_DX5;
  PDIDeviceObjectInstanceA = PDIDeviceObjectInstanceA_DX5;
{$ENDIF}

  DIDEVICEOBJECTINSTANCEA = TDIDeviceObjectInstanceA;
  LPDIDEVICEOBJECTINSTANCEA = PDIDeviceObjectInstanceA;

  PDIDeviceObjectInstanceW_DX3 = ^TDIDeviceObjectInstanceW_DX3;
  TDIDeviceObjectInstanceW_DX3 = record
    dwSize: DWORD;
    guidType: TGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    tszName: array[0..MAX_PATH-1] of WCHAR;
  end;

  PDIDeviceObjectInstanceW_DX5 = ^TDIDeviceObjectInstanceW_DX5;
  TDIDeviceObjectInstanceW_DX5 = record
    dwSize: DWORD;
    guidType: TGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    tszName: array[0..MAX_PATH-1] of WCHAR;
    dwFFMaxForce: DWORD;
    dwFFForceResolution: DWORD;
    wCollectionNumber: WORD;
    wDesignatorIndex: WORD;
    wUsagePage: WORD;
    wUsage: WORD;
    dwDimension: DWORD;
    wExponent: WORD;
    wReserved: WORD;
  end;

{$IFDEF DirectX3}
  TDIDeviceObjectInstanceW = TDIDeviceObjectInstanceW_DX3;
  PDIDeviceObjectInstanceW = PDIDeviceObjectInstanceW_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDIDeviceObjectInstanceW = TDIDeviceObjectInstanceW_DX5;
  PDIDeviceObjectInstanceW = PDIDeviceObjectInstanceW_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDIDeviceObjectInstanceW = TDIDeviceObjectInstanceW_DX5;
  PDIDeviceObjectInstanceW = PDIDeviceObjectInstanceW_DX5;
{$ENDIF}

  DIDEVICEOBJECTINSTANCEW = TDIDeviceObjectInstanceW;
  LPDIDEVICEOBJECTINSTANCEW = PDIDeviceObjectInstanceW;

  TDIDeviceObjectInstance = TDIDeviceObjectInstanceA;
  PDIDeviceObjectInstance = PDIDeviceObjectInstanceA;

  DIDEVICEOBJECTINSTANCE = TDIDeviceObjectInstance;
  LPDIDEVICEOBJECTINSTANCE = PDIDeviceObjectInstance;

  TDIEnumDeviceObjectsCallbackA = function(const peff: TDIDeviceObjectInstanceA;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMDEVICEOBJECTSCALLBACKA = TDIEnumDeviceObjectsCallbackA;

  TDIEnumDeviceObjectsCallbackW = function(const peff: TDIDeviceObjectInstanceW;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMDEVICEOBJECTSCALLBACKW = TDIEnumDeviceObjectsCallbackW;

  TDIEnumDeviceObjectsCallback = TDIEnumDeviceObjectsCallbackA;
  LPDIENUMDEVICEOBJECTSCALLBACK = TDIEnumDeviceObjectsCallback;

const
  DIDOI_FFACTUATOR      = $00000001;
  DIDOI_FFEFFECTTRIGGER = $00000002;
  DIDOI_POLLED          = $00008000;
  DIDOI_ASPECTPOSITION  = $00000100;
  DIDOI_ASPECTVELOCITY  = $00000200;
  DIDOI_ASPECTACCEL     = $00000300;
  DIDOI_ASPECTFORCE     = $00000400;
  DIDOI_ASPECTMASK      = $00000F00;

type
  PDIPropHeader = ^TDIPropHeader;
  TDIPropHeader = record
    dwSize: DWORD;
    dwHeaderSize: DWORD;
    dwObj: DWORD;
    dwHow: DWORD;
  end;

  DIPROPHEADER = TDIPropHeader;
  LPDIPROPHEADER = PDIPropHeader;

const
  DIPH_DEVICE   = 0;
  DIPH_BYOFFSET = 1;
  DIPH_BYID     = 2;

type
  PDIPropDWORD = ^TDIPropDWORD;
  TDIPropDWORD = record
    diph: TDIPropHeader;
    dwData: DWORD;
  end;

  DIPROPDWORD = TDIPropDWORD;
  LPDIPROPDWORD = PDIPropDWORD;

  PDIPropRange = ^TDIPropRange;
  TDIPropRange = record
    diph: TDIPropHeader;
    lMin: Longint;
    lMax: Longint;
  end;

  DIPROPRANGE = TDIPropRange;
  LPDIPROPRANGE = PDIPropRange;

const
  DIPROPRANGE_NOMIN   = $80000000;
  DIPROPRANGE_NOMAX   = $7FFFFFFF;

  DIPROP_BUFFERSIZE   = PGUID(1);
  DIPROP_AXISMODE     = PGUID(2);

  DIPROPAXISMODE_ABS  = 0;
  DIPROPAXISMODE_REL  = 1;

  DIPROP_GRANULARITY  = PGUID(3);
  DIPROP_RANGE        = PGUID(4);
  DIPROP_DEADZONE     = PGUID(5);
  DIPROP_SATURATION   = PGUID(6);
  DIPROP_FFGAIN       = PGUID(7);
  DIPROP_FFLOAD       = PGUID(8);
  DIPROP_AUTOCENTER   = PGUID(9);

  DIPROPAUTOCENTER_OFF = 0;
  DIPROPAUTOCENTER_ON  = 1;

  DIPROP_CALIBRATIONMODE = PGUID(10);

  DIPROPCALIBRATIONMODE_COOKED = 0;
  DIPROPCALIBRATIONMODE_RAW    = 1;

type
  PDIDeviceObjectData = ^TDIDeviceObjectData;
  TDIDeviceObjectData = record
    dwOfs: DWORD;
    dwData: DWORD;
    dwTimeStamp: DWORD;
    dwSequence: DWORD;
  end;

  DIDEVICEOBJECTDATA = TDIDeviceObjectData;
  LPDIDEVICEOBJECTDATA = PDIDeviceObjectData;

const
  DIGDD_PEEK = $00000001;

  DISCL_EXCLUSIVE    = $00000001;
  DISCL_NONEXCLUSIVE = $00000002;
  DISCL_FOREGROUND   = $00000004;
  DISCL_BACKGROUND   = $00000008;

type
  PDIDeviceInstanceA_DX3 = ^TDIDeviceInstanceA_DX3;
  TDIDeviceInstanceA_DX3 = record
    dwSize: DWORD;
    guidInstance: TGUID;
    guidProduct: TGUID;
    dwDevType: DWORD;
    tszInstanceName: array[0..MAX_PATH-1] of CHAR;
    tszProductName: array[0..MAX_PATH-1] of CHAR;
  end;

  PDIDeviceInstanceA_DX5 = ^TDIDeviceInstanceA_DX5;
  TDIDeviceInstanceA_DX5 = record
    dwSize: DWORD;
    guidInstance: TGUID;
    guidProduct: TGUID;
    dwDevType: DWORD;
    tszInstanceName: array[0..MAX_PATH-1] of CHAR;
    tszProductName: array[0..MAX_PATH-1] of CHAR;
    guidFFDriver: TGUID;
    wUsagePage: WORD;
    wUsage: WORD;
  end;

{$IFDEF DirectX3}
  TDIDeviceInstanceA = TDIDeviceInstanceA_DX3;
  PDIDeviceInstanceA = PDIDeviceInstanceA_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDIDeviceInstanceA = TDIDeviceInstanceA_DX5;
  PDIDeviceInstanceA = PDIDeviceInstanceA_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDIDeviceInstanceA = TDIDeviceInstanceA_DX5;
  PDIDeviceInstanceA = PDIDeviceInstanceA_DX5;
{$ENDIF}

  DIDEVICEINSTANCEA = TDIDeviceInstanceA;
  LPDIDEVICEINSTANCEA = PDIDeviceInstanceA;

  PDIDeviceInstanceW_DX3 = ^TDIDeviceInstanceW_DX3;
  TDIDeviceInstanceW_DX3 = record
    dwSize: DWORD;
    guidInstance: TGUID;
    guidProduct: TGUID;
    dwDevType: DWORD;
    tszInstanceName: array[0..MAX_PATH-1] of WCHAR;
    tszProductName: array[0..MAX_PATH-1] of WCHAR;
  end;

  PDIDeviceInstanceW_DX5 = ^TDIDeviceInstanceW_DX5;
  TDIDeviceInstanceW_DX5 = record
    dwSize: DWORD;
    guidInstance: TGUID;
    guidProduct: TGUID;
    dwDevType: DWORD;
    tszInstanceName: array[0..MAX_PATH-1] of WCHAR;
    tszProductName: array[0..MAX_PATH-1] of WCHAR;
    guidFFDriver: TGUID;
    wUsagePage: WORD;
    wUsage: WORD;
  end;

{$IFDEF DirectX3}
  TDIDeviceInstanceW = TDIDeviceInstanceW_DX3;
  PDIDeviceInstanceW = PDIDeviceInstanceW_DX3;
{$ENDIF}{$IFDEF DirectX5}
  TDIDeviceInstanceW = TDIDeviceInstanceW_DX5;
  PDIDeviceInstanceW = PDIDeviceInstanceW_DX5;
{$ENDIF}{$IFDEF DirectX6}
  TDIDeviceInstanceW = TDIDeviceInstanceW_DX5;
  PDIDeviceInstanceW = PDIDeviceInstanceW_DX5;
{$ENDIF}

  DIDEVICEINSTANCEW = TDIDeviceInstanceW;
  LPDIDEVICEINSTANCEW = PDIDeviceInstanceW;

  TDIDeviceInstance = TDIDeviceInstanceA;
  PDIDeviceInstance = PDIDeviceInstanceA;

  DIDEVICEINSTANCE = TDIDeviceInstance;
  LPDIDEVICEINSTANCE = PDIDeviceInstance;

  IDirectInputDeviceW = interface(IUnknown)
    ['{5944E681-C92E-11CF-BFC7-444553540000}']
    // IDirectInputDeviceW methods
    function GetCapabilities(var lpDIDevCaps: TDIDevCaps): HResult; stdcall;
    function EnumObjects(lpCallback: TDIEnumDeviceObjectsCallbackW;
        pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetProperty(rguidProp: PGUID; var pdiph: TDIPropHeader): HResult; stdcall;
    function SetProperty(rguidProp: PGUID; const pdiph: TDIPropHeader): HResult; stdcall;
    function Acquire: HResult; stdcall;
    function Unacquire: HResult; stdcall;
    function GetDeviceState(cbData: DWORD; var lpvData): HResult; stdcall;
    function GetDeviceData(cbObjectData: DWORD; var rgdod: TDIDeviceObjectData;
        var pdwInOut: DWORD; dwFlags: DWORD): HResult; stdcall;
    function SetDataFormat(const lpdf: TDIDataFormat): HResult; stdcall;
    function SetEventNotification(hEvent: THandle): HResult; stdcall;
    function SetCooperativeLevel(hwnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function GetObjectInfo(var pdidoi: TDIDeviceObjectInstanceW; dwObj: DWORD;
        dwHow: DWORD): HResult; stdcall;
    function GetDeviceInfo(var pdidi: TDIDeviceInstanceW): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD; const rguid: TGUID): HResult; stdcall;
  end;

  IDirectInputDeviceA = interface(IUnknown)
    ['{5944E680-C92E-11CF-BFC7-444553540000}']
    // IDirectInputDeviceA methods
    function GetCapabilities(var lpDIDevCaps: TDIDevCaps): HResult; stdcall;
    function EnumObjects(lpCallback: TDIEnumDeviceObjectsCallbackA;
        pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetProperty(rguidProp: PGUID; var pdiph: TDIPropHeader): HResult; stdcall;
    function SetProperty(rguidProp: PGUID; const pdiph: TDIPropHeader): HResult; stdcall;
    function Acquire: HResult; stdcall;
    function Unacquire: HResult; stdcall;
    function GetDeviceState(cbData: DWORD; var lpvData): HResult; stdcall;
    function GetDeviceData(cbObjectData: DWORD; var rgdod: TDIDeviceObjectData;
        var pdwInOut: DWORD; dwFlags: DWORD): HResult; stdcall;
    function SetDataFormat(const lpdf: TDIDataFormat): HResult; stdcall;
    function SetEventNotification(hEvent: THandle): HResult; stdcall;
    function SetCooperativeLevel(hwnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function GetObjectInfo(var pdidoi: TDIDeviceObjectInstanceA; dwObj: DWORD;
        dwHow: DWORD): HResult; stdcall;
    function GetDeviceInfo(var pdidi: TDIDeviceInstanceA): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD; const rguid: TGUID): HResult; stdcall;
  end;

  IDirectInputDevice = IDirectInputDeviceA;

const
  DISFFC_RESET           = $00000001;
  DISFFC_STOPALL         = $00000002;
  DISFFC_PAUSE           = $00000004;
  DISFFC_CONTINUE        = $00000008;
  DISFFC_SETACTUATORSON  = $00000010;
  DISFFC_SETACTUATORSOFF = $00000020;

  DIGFFS_EMPTY           = $00000001;
  DIGFFS_STOPPED         = $00000002;
  DIGFFS_PAUSED          = $00000004;
  DIGFFS_ACTUATORSON     = $00000010;
  DIGFFS_ACTUATORSOFF    = $00000020;
  DIGFFS_POWERON         = $00000040;
  DIGFFS_POWEROFF        = $00000080;
  DIGFFS_SAFETYSWITCHON  = $00000100;
  DIGFFS_SAFETYSWITCHOFF = $00000200;
  DIGFFS_USERFFSWITCHON  = $00000400;
  DIGFFS_USERFFSWITCHOFF = $00000800;
  DIGFFS_DEVICELOST      = $80000000;

type
  PDIEffectInfoA = ^TDIEffectInfoA;
  TDIEffectInfoA = record
    dwSize: DWORD;
    guid: TGUID;
    dwEffType: DWORD;
    dwStaticParams: DWORD;
    dwDynamicParams: DWORD;
    tszName: array[0..MAX_PATH-1] of CHAR;
  end;

  DIEFFECTINFOA = TDIEffectInfoA;
  LPDIEFFECTINFOA = PDIEffectInfoA;

  PDIEffectInfoW = ^TDIEffectInfoW;
  TDIEffectInfoW = record
    dwSize: DWORD;
    guid: TGUID;
    dwEffType: DWORD;
    dwStaticParams: DWORD;
    dwDynamicParams: DWORD;
    tszName: array[0..MAX_PATH-1] of WCHAR;
  end;

  DIEFFECTINFOW = TDIEffectInfoW;
  LPDIEFFECTINFOW = PDIEffectInfoW;

  DIEFFECTINFO = TDIEffectInfoA;
  LPDIEFFECTINFO = PDIEffectInfoA;

  TDIEnumEffectsCallbackA = function(const pdei: TDIEffectInfoA;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMEFFECTSCALLBACKA = TDIEnumEffectsCallbackA;

  TDIEnumEffectsCallbackW = function(const pdei: TDIEffectInfoW;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMEFFECTSCALLBACKW = TDIEnumEffectsCallbackW;

  TDIEnumEffectsCallback = TDIEnumEffectsCallbackA;
  LPDIENUMEFFECTSCALLBACK = TDIEnumEffectsCallback;

  LPDIENUMCREATEDEFFECTOBJECTSCALLBACK = function(const peff:
      IDirectInputEffect; pvRef: Pointer): HResult; stdcall;

  IDirectInputDevice2W = interface(IDirectInputDeviceW)
    ['{5944E683-C92E-11CF-BFC7-444553540000}']
    // IDirectInputDevice2W methods
    function CreateEffect(const rguid: TGUID; const lpeff: TDIEffect;
        out ppdeff: IDirectInputEffect; punkOuter: IUnknown): HResult; stdcall;
    function EnumEffects(lpCallback: TDIEnumEffectsCallbackW; pvRef: Pointer;
        dwEffType: DWORD): HResult; stdcall;
    function GetEffectInfo(var pdei: TDIEffectInfoW; const rguid: TGUID): HResult; stdcall;
    function GetForceFeedbackState(var pdwOut: DWORD): HResult; stdcall;
    function SendForceFeedbackCommand(dwFlags: DWORD): HResult; stdcall;
    function EnumCreatedEffectObjects(lpCallback:
        LPDIENUMCREATEDEFFECTOBJECTSCALLBACK; pvRef: Pointer; fl: DWORD): HResult; stdcall;
    function Escape(const pesc: TDIEffEscape): HResult; stdcall;
    function Poll: HResult; stdcall;
    function SendDeviceData(cbObjectData: DWORD; const rgdod: TDIDeviceObjectData;
        var pdwInOut: DWORD; fl: DWORD): HResult; stdcall;
  end;

  IDirectInputDevice2A = interface(IDirectInputDeviceA)
    ['{5944E682-C92E-11CF-BFC7-444553540000}']
    // IDirectInputDevice2A methods
    function CreateEffect(const rguid: TGUID; const lpeff: TDIEffect;
        out ppdeff: IDirectInputEffect; punkOuter: IUnknown): HResult; stdcall;
    function EnumEffects(lpCallback: TDIEnumEffectsCallbackA; pvRef: Pointer;
        dwEffType: DWORD): HResult; stdcall;
    function GetEffectInfo(var pdei: TDIEffectInfoA; const rguid: TGUID): HResult; stdcall;
    function GetForceFeedbackState(var pdwOut: DWORD): HResult; stdcall;
    function SendForceFeedbackCommand(dwFlags: DWORD): HResult; stdcall;
    function EnumCreatedEffectObjects(lpCallback:
        LPDIENUMCREATEDEFFECTOBJECTSCALLBACK; pvRef: Pointer; fl: DWORD): HResult; stdcall;
    function Escape(const pesc: TDIEffEscape): HResult; stdcall;
    function Poll: HResult; stdcall;
    function SendDeviceData(cbObjectData: DWORD; const rgdod: TDIDeviceObjectData;
        var pdwInOut: DWORD; fl: DWORD): HResult; stdcall;
  end;

  IDirectInputDevice2 = IDirectInputDevice2A;

{ Mouse }

type
  TDIMouseState = record
    lX: Longint;
    lY: Longint;
    lZ: Longint;
    rgbButtons: array[0..3] of BYTE;
  end;

  DIMOUSESTATE = TDIMouseState;

const
  _c_dfDIMouse_Objects: array[0..1] of TDIObjectDataFormat = (
    (pguid: nil;          dwOfs: 0;  dwType: DIDFT_RELAXIS or DIDFT_ANYINSTANCE; dwFlags: 0),
    (pguid: @GUID_Button; dwOfs: 12; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE;  dwFlags: 0)
  );

  c_dfDIMouse: TDIDataFormat = (
    dwSize: Sizeof(c_dfDIMouse);
    dwObjSize: Sizeof(TDIObjectDataFormat);
    dwFlags: DIDF_RELAXIS;
    dwDataSize: Sizeof(TDIMouseState);
    dwNumObjs: High(_c_dfDIMouse_Objects)+1;
    rgodf: @_c_dfDIMouse_Objects
  );

{ Keyboard }

type
  TDIKeyboardState = array[0..255] of Byte;
  DIKEYBOARDSTATE = TDIKeyboardState;

const
  _c_dfDIKeyboard_Objects: array[0..0] of TDIObjectDataFormat = (
    (pguid: @GUID_Key; dwOfs: 1; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE; dwFlags: 0)
  );

  c_dfDIKeyboard: TDIDataFormat = (
    dwSize: Sizeof(c_dfDIKeyboard);
    dwObjSize: Sizeof(TDIObjectDataFormat);
    dwFlags: 0;
    dwDataSize: SizeOf(TDIKeyboardState);
    dwNumObjs: High(_c_dfDIKeyboard_Objects)+1;
    rgodf: @_c_dfDIKeyboard_Objects
  );

{ DirectInput keyboard scan codes }

const
  DIK_ESCAPE          = $01;
  DIK_1               = $02;
  DIK_2               = $03;
  DIK_3               = $04;
  DIK_4               = $05;
  DIK_5               = $06;
  DIK_6               = $07;
  DIK_7               = $08;
  DIK_8               = $09;
  DIK_9               = $0A;
  DIK_0               = $0B;
  DIK_MINUS           = $0C;    // - on main keyboard
  DIK_EQUALS          = $0D;
  DIK_BACK            = $0E;    // backspace
  DIK_TAB             = $0F;
  DIK_Q               = $10;
  DIK_W               = $11;
  DIK_E               = $12;
  DIK_R               = $13;
  DIK_T               = $14;
  DIK_Y               = $15;
  DIK_U               = $16;
  DIK_I               = $17;
  DIK_O               = $18;
  DIK_P               = $19;
  DIK_LBRACKET        = $1A;
  DIK_RBRACKET        = $1B;
  DIK_RETURN          = $1C;    // Enter on main keyboard
  DIK_LCONTROL        = $1D;
  DIK_A               = $1E;
  DIK_S               = $1F;
  DIK_D               = $20;
  DIK_F               = $21;
  DIK_G               = $22;
  DIK_H               = $23;
  DIK_J               = $24;
  DIK_K               = $25;
  DIK_L               = $26;
  DIK_SEMICOLON       = $27;
  DIK_APOSTROPHE      = $28;
  DIK_GRAVE           = $29;    // accent grave
  DIK_LSHIFT          = $2A;
  DIK_BACKSLASH       = $2B;
  DIK_Z               = $2C;
  DIK_X               = $2D;
  DIK_C               = $2E;
  DIK_V               = $2F;
  DIK_B               = $30;
  DIK_N               = $31;
  DIK_M               = $32;
  DIK_COMMA           = $33;
  DIK_PERIOD          = $34;    // . on main keyboard
  DIK_SLASH           = $35;    // / on main keyboard
  DIK_RSHIFT          = $36;
  DIK_MULTIPLY        = $37;    // * on numeric keypad
  DIK_LMENU           = $38;    // left Alt
  DIK_SPACE           = $39;
  DIK_CAPITAL         = $3A;
  DIK_F1              = $3B;
  DIK_F2              = $3C;
  DIK_F3              = $3D;
  DIK_F4              = $3E;
  DIK_F5              = $3F;
  DIK_F6              = $40;
  DIK_F7              = $41;
  DIK_F8              = $42;
  DIK_F9              = $43;
  DIK_F10             = $44;
  DIK_NUMLOCK         = $45;
  DIK_SCROLL          = $46;    // Scroll Lock
  DIK_NUMPAD7         = $47;
  DIK_NUMPAD8         = $48;
  DIK_NUMPAD9         = $49;
  DIK_SUBTRACT        = $4A;    // - on numeric keypad
  DIK_NUMPAD4         = $4B;
  DIK_NUMPAD5         = $4C;
  DIK_NUMPAD6         = $4D;
  DIK_ADD             = $4E;    // + on numeric keypad
  DIK_NUMPAD1         = $4F;
  DIK_NUMPAD2         = $50;
  DIK_NUMPAD3         = $51;
  DIK_NUMPAD0         = $52;
  DIK_DECIMAL         = $53;    // . on numeric keypad
  DIK_F11             = $57;
  DIK_F12             = $58;

  DIK_F13             = $64;    //                     (NEC PC98)
  DIK_F14             = $65;    //                     (NEC PC98)
  DIK_F15             = $66;    //                     (NEC PC98)

  DIK_KANA            = $70;    // (Japanese keyboard)
  DIK_CONVERT         = $79;    // (Japanese keyboard)
  DIK_NOCONVERT       = $7B;    // (Japanese keyboard)
  DIK_YEN             = $7D;    // (Japanese keyboard)
  DIK_NUMPADEQUALS    = $8D;    // = on numeric keypad (NEC PC98)
  DIK_CIRCUMFLEX      = $90;    // (Japanese keyboard)
  DIK_AT              = $91;    //                     (NEC PC98)
  DIK_COLON           = $92;    //                     (NEC PC98)
  DIK_UNDERLINE       = $93;    //                     (NEC PC98)
  DIK_KANJI           = $94;    // (Japanese keyboard)
  DIK_STOP            = $95;    //                     (NEC PC98)
  DIK_AX              = $96;    //                     (Japan AX)
  DIK_UNLABELED       = $97;    //                        (J3100)
  DIK_NUMPADENTER     = $9C;    // Enter on numeric keypad
  DIK_RCONTROL        = $9D;
  DIK_NUMPADCOMMA     = $B3;    // , on numeric keypad (NEC PC98)
  DIK_DIVIDE          = $B5;    // / on numeric keypad
  DIK_SYSRQ           = $B7;
  DIK_RMENU           = $B8;    // right Alt
  DIK_HOME            = $C7;    // Home on arrow keypad
  DIK_UP              = $C8;    // UpArrow on arrow keypad
  DIK_PRIOR           = $C9;    // PgUp on arrow keypad
  DIK_LEFT            = $CB;    // LeftArrow on arrow keypad
  DIK_RIGHT           = $CD;    // RightArrow on arrow keypad
  DIK_END             = $CF;    // End on arrow keypad
  DIK_DOWN            = $D0;    // DownArrow on arrow keypad
  DIK_NEXT            = $D1;    // PgDn on arrow keypad
  DIK_INSERT          = $D2;    // Insert on arrow keypad
  DIK_DELETE          = $D3;    // Delete on arrow keypad
  DIK_LWIN            = $DB;    // Left Windows key
  DIK_RWIN            = $DC;    // Right Windows key
  DIK_APPS            = $DD;    // AppMenu key

//
//  Alternate names for keys, to facilitate transition from DOS.
//
  DIK_BACKSPACE       = DIK_BACK;            // backspace
  DIK_NUMPADSTAR      = DIK_MULTIPLY;        // * on numeric keypad
  DIK_LALT            = DIK_LMENU;           // left Alt
  DIK_CAPSLOCK        = DIK_CAPITAL;         // CapsLock
  DIK_NUMPADMINUS     = DIK_SUBTRACT;        // - on numeric keypad
  DIK_NUMPADPLUS      = DIK_ADD;             // + on numeric keypad
  DIK_NUMPADPERIOD    = DIK_DECIMAL;         // . on numeric keypad
  DIK_NUMPADSLASH     = DIK_DIVIDE;          // / on numeric keypad
  DIK_RALT            = DIK_RMENU;           // right Alt
  DIK_UPARROW         = DIK_UP;              // UpArrow on arrow keypad
  DIK_PGUP            = DIK_PRIOR;           // PgUp on arrow keypad
  DIK_LEFTARROW       = DIK_LEFT;            // LeftArrow on arrow keypad
  DIK_RIGHTARROW      = DIK_RIGHT;           // RightArrow on arrow keypad
  DIK_DOWNARROW       = DIK_DOWN;            // DownArrow on arrow keypad
  DIK_PGDN            = DIK_NEXT;            // PgDn on arrow keypad

{ Joystick }

type
  PDIJoyState = ^TDIJoyState;
  TDIJoyState = record
    lX: Longint;                        // x-axis position
    lY: Longint;                        // y-axis position
    lZ: Longint;                        // z-axis position
    lRx: Longint;                       // x-axis rotation
    lRy: Longint;                       // y-axis rotation
    lRz: Longint;                       // z-axis rotation
    rglSlider: array[0..1] of Longint;  // extra axes positions
    rgdwPOV: array[0..3] of DWORD;      // POV directions
    rgbButtons: array[0..31] of BYTE;   // 32 buttons
  end;

  DIJOYSTATE = TDIJoyState;

  PDIJOYSTATE2 = ^TDIJoyState2;
  TDIJoyState2 = record
    lX: Longint;                        // x-axis position
    lY: Longint;                        // y-axis position
    lZ: Longint;                        // z-axis position
    lRx: Longint;                       // x-axis rotation
    lRy: Longint;                       // y-axis rotation
    lRz: Longint;                       // z-axis rotation
    rglSlider: array[0..1] of Longint;  // extra axes positions
    rgdwPOV: array[0..3] of DWORD;      // POV directions
    rgbButtons: array[0..127] of BYTE;  // 128 buttons
    lVX: Longint;                       // x-axis velocity
    lVY: Longint;                       // y-axis velocity
    lVZ: Longint;                       // z-axis velocity
    lVRx: Longint;                      // x-axis angular velocity
    lVRy: Longint;                      // y-axis angular velocity
    lVRz: Longint;                      // z-axis angular velocity
    rglVSlider: array[0..1] of Longint; // extra axes velocities
    lAX: Longint;                       // x-axis acceleration
    lAY: Longint;                       // y-axis acceleration
    lAZ: Longint;                       // z-axis acceleration
    lARx: Longint;                      // x-axis angular acceleration
    lARy: Longint;                      // y-axis angular acceleration
    lARz: Longint;                      // z-axis angular acceleration
    rglASlider: array[0..1] of Longint; // extra axes accelerations
    lFX: Longint;                       // x-axis force
    lFY: Longint;                       // y-axis force
    lFZ: Longint;                       // z-axis force
    lFRx: Longint;                      // x-axis torque
    lFRy: Longint;                      // y-axis torque
    lFRz: Longint;                      // z-axis torque
    rglFSlider: array[0..1] of Longint; // extra axes forces
  end;

  DIJOYSTATE2 = TDIJoyState2;

{const
  _c_dfDIJoystick_Objects: array[0..1] of TDIObjectDataFormat = (
    (  pguid: nil;
       dwOfs: 0;
       dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE;
       dwFlags: 0),
    (  pguid: nil;
       dwOfs: 48;
       dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE;
       dwFlags: 0)
  );

  c_dfDIJoystick: TDIDataFormat = (
      dwSize: Sizeof(c_dfDIJoystick);
      dwObjSize: Sizeof(TDIObjectDataFormat);
      dwFlags: DIDF_ABSAXIS;
      dwDataSize: SizeOf(DIJOYSTATE);
      dwNumObjs: High(_c_dfDIJoystick_Objects)+1;
      rgodf: @_c_dfDIJoystick_Objects);
 }
const
  DIJOFS_X            = 0;
  DIJOFS_Y            = 4;
  DIJOFS_Z            = 8;
  DIJOFS_RX           = 12;
  DIJOFS_RY           = 16;
  DIJOFS_RZ           = 20;
  DIJOFS_SLIDER       = 24;
  DIJOFS_POV          = 32;
  DIJOFS_BUTTON       = 48;

{ IDirectInput }

const
  DIENUM_STOP = 0;
  DIENUM_CONTINUE = 1;

type

  TDIEnumDevicesCallbackA = function(const lpddi: TDIDeviceInstanceA;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMDEVICESCALLBACKA = TDIEnumDevicesCallbackA;

  TDIEnumDevicesCallbackW = function(const lpddi: TDIDeviceInstanceW;
      pvRef: Pointer): HResult; stdcall;
  LPDIENUMDEVICESCALLBACKW = TDIEnumDevicesCallbackW;

  TDIEnumDevicesCallback = TDIEnumDevicesCallbackA;
  LPDIENUMDEVICESCALLBACK = TDIEnumDevicesCallback;

const
  DIEDFL_ALLDEVICES    = $00000000;
  DIEDFL_ATTACHEDONLY  = $00000001;
  DIEDFL_FORCEFEEDBACK = $00000100;

type
  IDirectInputW = interface(IUnknown)
    ['{89521361-AA8A-11CF-BFC7-444553540000}']
    // IDirectInputW methods
    function CreateDevice(const rguid: TGUID;
        out lplpDirectInputDevice: IDirectInputDeviceW; pUnkOuter: IUnknown): HResult; stdcall;
    function EnumDevices(dwDevType: DWORD; lpCallback: TDIEnumDevicesCallbackW;
        pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetDeviceStatus(var rguidInstance: TGUID): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD): HResult; stdcall;
  end;

  IDirectInputA = interface(IUnknown)
    ['{89521360-AA8A-11CF-BFC7-444553540000}']
    // IDirectInputA methods
    function CreateDevice(const rguid: TGUID;
        out lplpDirectInputDevice: IDirectInputDeviceA; pUnkOuter: IUnknown): HResult; stdcall;
    function EnumDevices(dwDevType: DWORD; lpCallback: TDIEnumDevicesCallbackA;
        pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetDeviceStatus(const rguidInstance: TGUID): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD): HResult; stdcall;
  end;

  IDirectInput = IDirectInputA;

  IDirectInput2W = interface(IDirectInputW)
    ['{5944E663-AA8A-11CF-BFC7-444553540000}']
    // IDirectInput2W methods
    function FindDevice(Arg1: PGUID; Arg2: PWideChar; Arg3: PGUID): HResult; stdcall;
  end;

  IDirectInput2A = interface(IDirectInputA)
    ['{5944E662-AA8A-11CF-BFC7-444553540000}']
    // IDirectInput2A methods
    function FindDevice(Arg1: PGUID; Arg2: PAnsiChar; Arg3: PGUID): HResult; stdcall;
  end;

  IDirectInput2 = IDirectInput2A;

{ Return Codes }

const
  DI_OK = S_OK;
  DI_NOTATTACHED = S_FALSE;
  DI_BUFFEROVERFLOW = S_FALSE;
  DI_PROPNOEFFECT = S_FALSE;
  DI_NOEFFECT = S_FALSE;
  DI_POLLEDDEVICE = $00000002;
  DI_DOWNLOADSKIPPED = $00000003;
  DI_EFFECTRESTARTED = $00000004;
  DI_TRUNCATED = $00000008;
  DI_TRUNCATEDANDRESTARTED = $0000000C;

  DIERR_OLDDIRECTINPUTVERSION = -2147023746;
  DIERR_BETADIRECTINPUTVERSION = -2147023743;
  DIERR_BADDRIVERVER = -2147024777;
  DIERR_DEVICENOTREG = REGDB_E_CLASSNOTREG;
  DIERR_NOTFOUND = -2147024894;
  DIERR_OBJECTNOTFOUND = -2147024894;
  DIERR_INVALIDPARAM = E_INVALIDARG;
  DIERR_NOINTERFACE = E_NOINTERFACE;
  DIERR_GENERIC = E_FAIL;
  DIERR_OUTOFMEMORY = E_OUTOFMEMORY;
  DIERR_UNSUPPORTED = E_NOTIMPL;
  DIERR_NOTINITIALIZED = -2147024875;
  DIERR_ALREADYINITIALIZED = -2147023649;
  DIERR_NOAGGREGATION = CLASS_E_NOAGGREGATION;
  DIERR_OTHERAPPHASPRIO = E_ACCESSDENIED;
  DIERR_INPUTLOST = -2147024866;
  DIERR_ACQUIRED = -2147024726;
  DIERR_NOTACQUIRED = -2147024884;
  DIERR_READONLY = E_ACCESSDENIED;
  DIERR_HANDLEEXISTS = E_ACCESSDENIED;
  DIERR_PENDING = $80070007;
  DIERR_INSUFFICIENTPRIVS = $80040200;
  DIERR_DEVICEFULL = $80040201;
  DIERR_MOREDATA = $80040202;
  DIERR_NOTDOWNLOADED = $80040203;
  DIERR_HASEFFECTS = $80040204;
  DIERR_NOTEXCLUSIVEACQUIRED = $80040205;
  DIERR_INCOMPLETEEFFECT = $80040206;
  DIERR_NOTBUFFERED = $80040207;
  DIERR_EFFECTPLAYING = $80040208;

{ Definitions for non-IDirectInput (VJoyD) features defined more recently
  than the current sdk files }

  JOY_PASSDRIVERDATA = $10000000;
  JOY_HWS_ISHEADTRACKER = $02000000;
  JOY_HWS_ISGAMEPORTDRIVER = $04000000;
  JOY_HWS_ISANALOGPORTDRIVER = $08000000;
  JOY_HWS_AUTOLOAD = $10000000;
  JOY_HWS_NODEVNODE = $20000000;
  JOY_HWS_ISGAMEPORTEMULATOR = $40000000;
  JOY_US_VOLATILE = $00000008;

{ Definitions for non-IDirectInput (VJoyD) features defined more recently
  than the current ddk files }

  JOY_OEMPOLL_PASSDRIVERDATA = 7;

function DirectInputCreate(hinst: THandle; dwVersion: DWORD;
    out ppDI: IDirectInputA; punkOuter: IUnknown): HResult; stdcall;

(*==========================================================================;
 *
 *  Copyright (C) Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dplay.h
 *  Content:    DirectPlay include file
 *
 ***************************************************************************)

const
{ GUIDS used by DirectPlay objects }

  CLSID_DirectPlay: TGUID = '{D1EB6D20-8923-11D0-9D97-00A0C90A43CB}';

  IID_IDirectPlay: TGUID = '{5454E9A0-DB65-11CE-921C-00AA006C4972}';
  IID_IDirectPlay2: TGUID = '{2B74F7C0-9154-11CF-A9CD-00AA006886E3}';
  IID_IDirectPlay2A: TGUID = '{9D460580-A822-11CF-960C-0080C7534E82}';
  IID_IDirectPlay3: TGUID = '{133EFE40-32DC-11D0-9CFB-00A0C90A43CB}';
  IID_IDirectPlay3A: TGUID = '{133EFE41-32DC-11D0-9CFB-00A0C90A43CB}';
  IID_IDirectPlay4: TGUID = '{0AB1C530-4745-11D1-A7A1-0000F803ABFC}';
  IID_IDirectPlay4A: TGUID = '{0AB1C531-4745-11D1-A7A1-0000F803ABFC}';

{ GUIDS used by Service Providers shipped with DirectPlay
  Use these to identify Service Provider returned by EnumConnections }

  DPSPGUID_IPX: TGUID = '{685BC400-9D2C-11CF-A9CD-00AA006886E3}';
  DPSPGUID_TCPIP: TGUID = '{36E95EE0-8577-11CF-960C-0080C7534E82}';
  DPSPGUID_SERIAL: TGUID = '{0F1D6860-88D9-11CF-9C4E-00A0C905425E}';
  DPSPGUID_MODEM: TGUID = '{44EAA760-CB68-11CF-9C4E-00A0C905425E}';

{ DirectPlay Structures }

type
  PDPID = ^TDPID;
  TDPID = DWORD;

  DPID = TDPID;
  LPDPID = PDPID;

const
  DPID_SYSMSG        = 0;          // DPID that system messages come from
  DPID_ALLPLAYERS    = 0;          // DPID representing all players in the session
  DPID_SERVERPLAYER  = 1;          // DPID representing the server player
  DPID_RESERVEDRANGE = 100;        // DPID representing the maxiumum ID in the range of DPID's reserved for
                                   // use by DirectPlay.
  DPID_UNKNOWN       = $FFFFFFFF;  // The player ID is unknown (used with e.g. DPSESSION_NOMESSAGEID)

type
  PDPCaps = ^TDPCaps;
  TDPCaps = record
    dwSize: DWORD;              // Size of structure, in bytes
    dwFlags: DWORD;             // DPCAPS_xxx flags
    dwMaxBufferSize: DWORD;     // Maximum message size, in bytes,  for this service provider
    dwMaxQueueSize: DWORD;      // Obsolete.
    dwMaxPlayers: DWORD;        // Maximum players/groups (local + remote)
    dwHundredBaud: DWORD;       // Bandwidth in 100 bits per second units;
                                // i.e. 24 is 2400, 96 is 9600, etc.
    dwLatency: DWORD;           // Estimated latency; 0 = unknown
    dwMaxLocalPlayers: DWORD;   // Maximum # of locally created players allowed
    dwHeaderLength: DWORD;      // Maximum header length, in bytes, on messages
                                // added by the service provider
    dwTimeout: DWORD;           // Service provider's suggested timeout value
                                // This is how long DirectPlay will wait for
                                // responses to system messages
  end;

  DPCAPS = TDPCaps;
  LPDPCAPS = PDPCaps;

const
  DPCAPS_ISHOST                  = $00000002;
  DPCAPS_GROUPOPTIMIZED          = $00000008;
  DPCAPS_KEEPALIVEOPTIMIZED      = $00000010;
  DPCAPS_GUARANTEEDOPTIMIZED     = $00000020;
  DPCAPS_GUARANTEEDSUPPORTED     = $00000040;
  DPCAPS_SIGNINGSUPPORTED        = $00000080;
  DPCAPS_ENCRYPTIONSUPPORTED     = $00000100;
  DPPLAYERCAPS_LOCAL             = $00000800;
  DPCAPS_ASYNCCANCELSUPPORTED    = $00001000;
  DPCAPS_ASYNCCANCELALLSUPPORTED = $00002000;
  DPCAPS_SENDTIMEOUTSUPPORTED    = $00004000;
  DPCAPS_SENDPRIORITYSUPPORTED   = $00008000;
  DPCAPS_ASYNCSUPPORTED          = $00010000;


type

  PDPSessionDesc2 = ^TDPSessionDesc2;
  TDPSessionDesc2 = record
    dwSize: DWORD;               // Size of structure
    dwFlags: DWORD;              // DPSESSION_xxx flags
    guidInstance: TGUID;         // ID for the session instance
    guidApplication: TGUID;      // GUID of the DirectPlay application.
                                 // GUID_NULL for all applications.
    dwMaxPlayers: DWORD;         // Maximum # players allowed in session
    dwCurrentPlayers: DWORD;     // Current # players in session (read only)

    case Integer of
      0: (
        lpszSessionName: LPWSTR; // Name of the session - Unicode
        lpszPassword: LPWSTR;    // Password of the session (optional) - Unicode
        dwReserved1: DWORD;      // Reserved for future MS use.
        dwReserved2: DWORD;
        dwUser1: DWORD;          // For use by the application
        dwUser2: DWORD;
        dwUser3: DWORD;
        dwUser4: DWORD;
        );
      1: (
        lpszSessionNameA: LPSTR; // Name of the session - ANSI
        lpszPasswordA: LPSTR;    // Password of the session (optional) - ANSI
        );
  end;

  DPSESSIONDESC2 = TDPSessionDesc2;
  LPDPSESSIONDESC2 = PDPSessionDesc2;

const
  DPSESSION_NEWPLAYERSDISABLED = $00000001;
  DPSESSION_MIGRATEHOST        = $00000004;
  DPSESSION_NOMESSAGEID        = $00000008;
  DPSESSION_JOINDISABLED       = $00000020;
  DPSESSION_KEEPALIVE          = $00000040;
  DPSESSION_NODATAMESSAGES     = $00000080;
  DPSESSION_SECURESERVER       = $00000100;
  DPSESSION_PRIVATE            = $00000200;
  DPSESSION_PASSWORDREQUIRED   = $00000400;
  DPSESSION_MULTICASTSERVER    = $00000800;
  DPSESSION_CLIENTSERVER       = $00001000;
  DPSESSION_DIRECTPLAYPROTOCOL = $00002000;
  DPSESSION_NOPRESERVEORDER    = $00004000;
  DPSESSION_OPTIMIZELATENCY    = $00008000;

type
  PDPName = ^TDPName;
  TDPName = record
    dwSize: DWORD;    // Size of structure
    dwFlags: DWORD;   // Not used. Must be zero.
    case Integer of
      0: (
        lpszShortName: LPWSTR; // The short or friendly name - Unicode
        lpszLongName: LPWSTR   // The long or formal name - Unicode
        );
      1: (
        lpszShortNameA: LPSTR; // The short or friendly name - ANSI
        lpszLongNameA: LPSTR   // The long or formal name - ANSI
        );
  end;

  DPNAME = TDPName;
  LPDPNAME = PDPName;

(*
 * TDPCredentials
 * Used to hold the user name and password of a DirectPlay user
 *)

  PDPCredentials = ^TDPCredentials;
  TDPCredentials = record
    dwSize: DWORD;    // Size of structure
    dwFlags: DWORD;   // Not used. Must be zero.
    case Integer of
      0: (
        lpszUsername: LPWSTR;   // User name of the account - Unicode
        lpszPassword: LPWSTR;   // Password of the account - Unicode
        lpszDomain: LPWSTR;     // Domain name of the account - Unicode
        );
      1: (
        lpszUsernameA: LPSTR;   // User name of the account - ANSI
        lpszPasswordA: LPSTR;   // Password of the account - ANSI
        lpszDomainA: LPSTR      // Domain name of the account - ANSI
        );
  end;

  DPCREDENTIALS = TDPCredentials;
  LPDPCREDENTIALS = PDPCredentials;

(*
 * DPSECURITYDESC
 * Used to describe the security properties of a DirectPlay
 * session instance
 *)

  PDPSecurityDesc = ^TDPSecurityDesc;
  TDPSecurityDesc = record
    dwSize: DWORD;                  // Size of structure
    dwFlags: DWORD;                 // Not used. Must be zero.
    case Integer of
      0: (
        lpszSSPIProvider: LPWSTR;     // SSPI provider name - Unicode
        lpszCAPIProvider: LPWSTR;     // CAPI provider name - Unicode
        dwCAPIProviderType: DWORD;    // Crypto Service Provider type
        dwEncryptionAlgorithm: DWORD; // Encryption Algorithm type
        );
      1: (
        lpszSSPIProviderA: LPSTR;     // SSPI provider name - ANSI
        lpszCAPIProviderA: LPSTR;     // CAPI provider name - ANSI
        );
  end;

  DPSECURITYDESC = TDPSecurityDesc;
  LPDPSECURITYDESC = PDPSecurityDesc;

(*
 * TDPAccountDesc
 * Used to describe a user membership account
 *)
  PDPAccountDesc = ^TDPAccountDesc;
  TDPAccountDesc = record
    dwSize: DWORD;    // Size of structure
    dwFlags: DWORD;   // Not used. Must be zero.
    case Integer of
      0: (
        lpszAccountID: LPWSTR;  // Account identifier - Unicode
        );
      1: (
        lpszAccountIDA: LPSTR;  // Account identifier - ANSI
        );
  end;

  DPACCOUNTDESC = TDPAccountDesc;
  LPDPACCOUNTDESC = PDPAccountDesc;

(*
 * TDPLConnection
 * Used to hold all in the informaion needed to connect
 * an application to a session or create a session
 *)

  PDPLConnection = ^TDPLConnection;
  TDPLConnection = record
    dwSize: DWORD;                     // Size of this structure
    dwFlags: DWORD;                    // Flags specific to this structure
    lpSessionDesc: PDPSessionDesc2;    // Pointer to session desc to use on connect
    lpPlayerName: PDPName;             // Pointer to Player name structure
    guidSP: TGUID;                     // GUID of the DPlay SP to use
    lpAddress: Pointer;                // Address for service provider
    dwAddressSize: DWORD;              // Size of address data
  end;

  DPLCONNECTION = TDPLConnection;
  LPDPLCONNECTION = PDPLConnection;

(*
 * TDPChat
 * Used to hold the a DirectPlay chat message
 *)

  PDPChat = ^TDPChat;
  TDPChat = record
    dwSize: DWORD;
    dwFlags: DWORD;
    case Integer of
      0: (
        lpszMessage: LPWSTR;  // Message string - Unicode
        );
      1: (
        lpszMessageA: LPSTR;  // Message string - ANSI
        );
  end;

  DPCHAT = TDPChat;
  LPDPCHAT = PDPChat;

(*
 * SGBUFFER
 * Scatter Gather Buffer used for SendEx
 *)

  PSGBuffer = ^TSGBuffer;
  TSGBuffer = record
    len: UINT;      // length of buffer data
    pData: PUChar;  // pointer to buffer data
  end;

  SGBUFFER = TSGBuffer;
  LPSGBUFFER = PSGBuffer;

{ Prototypes for DirectPlay callback functions }

{ Callback for IDirectPlay2::EnumSessions }

  TDPEnumSessionsCallback2 = function(const lpThisSD: TDPSessionDesc2;
      var lpdwTimeOut: DWORD; dwFlags: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMSESSIONSCALLBACK2 = TDPEnumSessionsCallback2;

const
  DPESC_TIMEDOUT = $00000001;

type
  TDPEnumPlayersCallback2 = function(dpId: TDPID; dwPlayerType: DWORD;
      const lpName: TDPName; dwFlags: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMPLAYERSCALLBACK2 = TDPEnumPlayersCallback2;

  TDPEnumDPCallback = function(const lpguidSP: TGUID; lpSPName: LPWSTR;
      dwMajorVersion: DWORD; dwMinorVersion: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMDPCALLBACK = TDPEnumDPCallback;

  TDPEnumDPCallbackA = function(const lpguidSP: TGUID; lpSPName: LPSTR;
      dwMajorVersion: DWORD; dwMinorVersion: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMDPCALLBACKA = TDPEnumDPCallbackA;

  TDPEnumConnectionsCallback = function(const lpguidSP: TGUID;
      lpConnection: Pointer; dwConnectionSize: DWORD; const lpName: TDPName;
      dwFlags: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMCONNECTIONSCALLBACK = TDPEnumConnectionsCallback;

{ API's }

function DirectPlayEnumerateA(lpEnumDPCallback: TDPEnumDPCallbackA;
    lpContext: Pointer): HResult; stdcall;
function DirectPlayEnumerateW(lpEnumDPCallback: TDPEnumDPCallback;
    lpContext: Pointer): HResult; stdcall;
function DirectPlayEnumerate(lpEnumDPCallback: TDPEnumDPCallbackA;
    lpContext: Pointer): HResult; stdcall;


{ IDirectPlay2 (and IDirectPlay2A) Interface }

type
  IDirectPlay2 = interface(IUnknown)
    ['{2B74F7C0-9154-11CF-A9CD-00AA006886E3}']
    // IDirectPlay2 methods
    function AddPlayerToGroup(idGroup: TDPID; idPlayer: TDPID): HResult; stdcall;
    function Close: HResult; stdcall;
    function CreateGroup(var lpidGroup: TDPID; const lpGroupName: TDPName;
        const lpData; dwDataSize: DWORD; dwFlags: DWORD): HResult; stdcall;
    function CreatePlayer(var lpidPlayer: TDPID; const pPlayerName: TDPName;
        hEvent: THandle; const lpData; dwDataSize: DWORD; dwFliags: DWORD): HResult; stdcall;
    function DeletePlayerFromGroup(idGroup: TDPID; idPlayer: TDPID): HResult; stdcall;
    function DestroyGroup(idGroup: TDPID): HResult; stdcall;
    function DestroyPlayer(idPlayer: TDPID): HResult; stdcall;
    function EnumGroupPlayers(idGroup: TDPID; const lpguidInstance: TGUID;
        lpEnumPlayersCallback2: TDPEnumPlayersCallback2; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function EnumGroups(const lpguidInstance: TGUID; lpEnumPlayersCallback2:
        LPDPENUMPLAYERSCALLBACK2; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function EnumPlayers(const lpguidInstance: TGUID; lpEnumPlayersCallback2:
        LPDPENUMPLAYERSCALLBACK2; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function EnumSessions(const lpsd: TDPSessionDesc2; dwTimeout: DWORD;
        lpEnumSessionsCallback2: TDPEnumSessionsCallback2; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function GetCaps(var lpDPCaps: TDPCaps; dwFlags: DWORD): HResult; stdcall;
    function GetGroupData(idGroup: TDPID; var lpData; var lpdwDataSize: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function GetGroupName(idGroup: TDPID; var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function GetMessageCount(idPlayer: TDPID; var lpdwCount: DWORD): HResult; stdcall;
    function GetPlayerAddress(idPlayer: TDPID; var lpAddress;
        var lpdwAddressSize: DWORD): HResult; stdcall;
    function GetPlayerCaps(idPlayer: TDPID; var lpPlayerCaps: TDPCaps;
        dwFlags: DWORD): HResult; stdcall;
    function GetPlayerData(idPlayer: TDPID; var lpData; var lpdwDataSize: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function GetPlayerName(idPlayer: TDPID; var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function GetSessionDesc(var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function Initialize(const lpGUID: TGUID): HResult; stdcall;
    function Open(var lpsd: TDPSessionDesc2; dwFlags: DWORD): HResult; stdcall;
    function Receive(var lpidFrom: TDPID; var lpidTo: TDPID; dwFlags: DWORD;
        var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function Send(idFrom: TDPID; lpidTo: TDPID; dwFlags: DWORD; const lpData;
        lpdwDataSize: DWORD): HResult; stdcall;
    function SetGroupData(idGroup: TDPID; const lpData; dwDataSize: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function SetGroupName(idGroup: TDPID; const lpGroupName: TDPName;
        dwFlags: DWORD): HResult; stdcall;
    function SetPlayerData(idPlayer: TDPID; const lpData; dwDataSize: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function SetPlayerName(idPlayer: TDPID; const lpPlayerName: TDPName;
        dwFlags: DWORD): HResult; stdcall;
    function SetSessionDesc(const lpSessDesc: TDPSessionDesc2; dwFlags: DWORD): HResult; stdcall;
  end;

  IDirectPlay2A = interface(IDirectPlay2)
    ['{9D460580-A822-11CF-960C-0080C7534E82}']
  end;

{ IDirectPlay3 (and IDirectPlay3A) Interface }

  IDirectPlay3 = interface(IDirectPlay2)
    ['{133EFE40-32DC-11D0-9CFB-00A0C90A43CB}']
    // IDirectPlay3 methods
    function AddGroupToGroup(idParentGroup: TDPID; idGroup: TDPID): HResult; stdcall;
    function CreateGroupInGroup(idParentGroup: TDPID; var lpidGroup: TDPID;
        var lpGroupName: TDPName; const lpData; dwDataSize: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function DeleteGroupFromGroup(idParentGroup: TDPID; idGroup: TDPID): HResult; stdcall;
    function EnumConnections(const lpguidApplication: TGUID;
        lpEnumCallback: TDPEnumConnectionsCallback; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function EnumGroupsInGroup(idGroup: TDPID; const lpguidInstance: TGUID;
        lpEnumPlayersCallback2: TDPEnumPlayersCallback2; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function GetGroupConnectionSettings(dwFlags: DWORD; idGroup: TDPID;
        var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function InitializeConnection(lpConnection: Pointer; dwFlags: DWORD): HResult; stdcall;
    function SecureOpen(const lpsd: TDPSessionDesc2; dwFlags: DWORD;
        const lpSecurity: TDPSecurityDesc; const lpCredentials: TDPCredentials): HResult; stdcall;
    function SendChatMessage(idFrom: TDPID; idTo: TDPID; dwFlags: DWORD;
        const lpChatMessage: TDPChat): HResult; stdcall;
    function SetGroupConnectionSettings(dwFlags: DWORD; idGroup: TDPID;
        const lpConnection: TDPLConnection): HResult; stdcall;
    function StartSession(dwFlags: DWORD; idGroup: TDPID): HResult; stdcall;
    function GetGroupFlags(idGroup: TDPID; var lpdwFlags: DWORD): HResult; stdcall;
    function GetGroupParent(idGroup: TDPID; var lpidParent: TDPID): HResult; stdcall;
    function GetPlayerAccount(idPlayer: TDPID; dwFlags: DWORD; var lpData;
        var lpdwDataSize: DWORD): HResult; stdcall;
    function GetPlayerFlags(idPlayer: TDPID; var lpdwFlags: DWORD): HResult; stdcall;
  end;

  IDirectPlay3A = interface(IDirectPlay3)
    ['{133EFE41-32DC-11D0-9CFB-00A0C90A43CB}']
  end;

{ IDirectPlay4 (and IDirectPlay4A) Interface }

  IDirectPlay4 = interface(IDirectPlay3)
    ['{0AB1C530-4745-11D1-A7A1-0000F803ABFC}']
    // IDirectPlay4 methods
    function GetGroupOwner(idGroup: TDPID; var idOwner: TDPID): HResult; stdcall;
    function SetGroupOwner(idGroup: TDPID; idOwner: TDPID): HResult; stdcall;
    function SendEx(idFrom: TDPID; idTo: TDPID; dwFlags: DWORD; const pData;
        dwDataSize: DWORD; dwPriority: DWORD; dwTimeout: DWORD;
        lpContext: Pointer; lpdwMsgId: PDWORD): HResult; stdcall;
    function GetMessageQueue(idFrom: TDPID; idTo: TDPID; dwFlags: DWORD;
        var lpdwNumMsgs: DWORD; var lpdwNumBytes: DWORD): HResult; stdcall;
    function CancelMessage(dwMessageID: DWORD; dwFlags: DWORD): HResult; stdcall;
    function CancelPriority(dwMinPriority: DWORD; dwMaxPriority: DWORD; dwFlags: DWORD): HResult; stdcall;
 end;

  IDirectPlay4A = interface(IDirectPlay4)
    ['{0AB1C531-4745-11D1-A7A1-0000F803ABFC}']
  end;

const
{ EnumConnections API flags }

  DPCONNECTION_DIRECTPLAY      = $00000001;
  DPCONNECTION_DIRECTPLAYLOBBY = $00000002;

{ EnumPlayers API flags }

  DPENUMPLAYERS_ALL          = $00000000;
  DPENUMGROUPS_ALL           = DPENUMPLAYERS_ALL;
  DPENUMPLAYERS_LOCAL        = $00000008;
  DPENUMGROUPS_LOCAL         = DPENUMPLAYERS_LOCAL;
  DPENUMPLAYERS_REMOTE       = $00000010;
  DPENUMGROUPS_REMOTE        = DPENUMPLAYERS_REMOTE;
  DPENUMPLAYERS_GROUP        = $00000020;
  DPENUMPLAYERS_SESSION      = $00000080;
  DPENUMGROUPS_SESSION       = DPENUMPLAYERS_SESSION;
  DPENUMPLAYERS_SERVERPLAYER = $00000100;
  DPENUMPLAYERS_SPECTATOR    = $00000200;
  DPENUMGROUPS_SHORTCUT      = $00000400;
  DPENUMGROUPS_STAGINGAREA   = $00000800;
  DPENUMGROUPS_HIDDEN        = $00001000;
  DPENUMPLAYERS_OWNER        = $00002000;

{ CreatePlayer API flags }

  DPPLAYER_SERVERPLAYER = DPENUMPLAYERS_SERVERPLAYER;
  DPPLAYER_SPECTATOR    = DPENUMPLAYERS_SPECTATOR;
  DPPLAYER_LOCAL        = DPENUMPLAYERS_LOCAL;
  DPPLAYER_OWNER        = DPENUMPLAYERS_OWNER;

{ CreateGroup API flags }

  DPGROUP_STAGINGAREA = DPENUMGROUPS_STAGINGAREA;
  DPGROUP_LOCAL       = DPENUMGROUPS_LOCAL;
  DPGROUP_HIDDEN      = DPENUMGROUPS_HIDDEN;

{ EnumSessions API flags }

  DPENUMSESSIONS_AVAILABLE        = $00000001;
  DPENUMSESSIONS_ALL              = $00000002;
  DPENUMSESSIONS_ASYNC            = $00000010;
  DPENUMSESSIONS_STOPASYNC        = $00000020;
  DPENUMSESSIONS_PASSWORDREQUIRED = $00000040;
  DPENUMSESSIONS_RETURNSTATUS     = $00000080;

{ GetCaps and GetPlayerCaps API flags }

  DPGETCAPS_GUARANTEED = $00000001;

{ GetGroupData, GetPlayerData API flags }

  DPGET_REMOTE = $00000000;
  DPGET_LOCAL  = $00000001;

{ Open API flags }

  DPOPEN_JOIN         = $00000001;
  DPOPEN_CREATE       = $00000002;
  DPOPEN_RETURNSTATUS = DPENUMSESSIONS_RETURNSTATUS;

{ TDPLConnection flags }

  DPLCONNECTION_CREATESESSION = DPOPEN_CREATE;
  DPLCONNECTION_JOINSESSION   = DPOPEN_JOIN;

{ Receive API flags }

  DPRECEIVE_ALL        = $00000001;
  DPRECEIVE_TOPLAYER   = $00000002;
  DPRECEIVE_FROMPLAYER = $00000004;
  DPRECEIVE_PEEK       = $00000008;

{ Send API flags }

  DPSEND_GUARANTEED         = $00000001;
  DPSEND_HIGHPRIORITY       = $00000002;
  DPSEND_OPENSTREAM         = $00000008;
  DPSEND_CLOSESTREAM        = $00000010;
  DPSEND_SIGNED             = $00000020;
  DPSEND_ENCRYPTED          = $00000040;
  DPSEND_LOBBYSYSTEMMESSAGE = $00000080;
  DPSEND_ASYNC		    = $00000200;
  DPSEND_NOSENDCOMPLETEMSG  = $00000400;
  DPSEND_MAX_PRI            = $0000FFFF;
  DPSEND_MAX_PRIORITY       = DPSEND_MAX_PRI;

{ SetGroupData, SetGroupName, SetPlayerData, SetPlayerName,
  SetSessionDesc API flags. }

  DPSET_REMOTE     = $00000000;
  DPSET_LOCAL      = $00000001;
  DPSET_GUARANTEED = $00000002;

{ GetMessageQueue API flags. }

  DPMESSAGEQUEUE_SEND    = $00000001; // Default
  DPMESSAGEQUEUE_RECEIVE = $00000002; // Default

{ Connect API flags }

  DPCONNECT_RETURNSTATUS = DPENUMSESSIONS_RETURNSTATUS;

{ DirectPlay system messages and message data structures }

  DPSYS_CREATEPLAYERORGROUP   = $0003;
  DPSYS_DESTROYPLAYERORGROUP  = $0005;
  DPSYS_ADDPLAYERTOGROUP      = $0007;
  DPSYS_DELETEPLAYERFROMGROUP = $0021;
  DPSYS_SESSIONLOST           = $0031;
  DPSYS_HOST                  = $0101;
  DPSYS_SETPLAYERORGROUPDATA  = $0102;
  DPSYS_SETPLAYERORGROUPNAME  = $0103;
  DPSYS_SETSESSIONDESC        = $0104;
  DPSYS_ADDGROUPTOGROUP       = $0105;
  DPSYS_DELETEGROUPFROMGROUP  = $0106;
  DPSYS_SECUREMESSAGE         = $0107;
  DPSYS_STARTSESSION          = $0108;
  DPSYS_CHAT                  = $0109;
  DPSYS_SETGROUPOWNER         = $010A;
  DPSYS_SENDCOMPLETE          = $010d;


{ Used in the dwPlayerType field to indicate if it applies to a group or a player}

  DPPLAYERTYPE_GROUP          = $00000000;
  DPPLAYERTYPE_PLAYER         = $00000001;

{ TDPMsg_Generic }

type
  PDPMsg_Generic = ^TDPMsg_Generic;
  TDPMsg_Generic = record
    dwType: DWORD;   // Message type
  end;

  DPMSG_GENERIC = TDPMsg_Generic;
  LPDPMSG_GENERIC = PDPMsg_Generic;

{ TDPMsg_CreatePlayerOrGroup }

  PDPMsg_CreatePlayerOrGroup = ^TDPMsg_CreatePlayerOrGroup;
  TDPMsg_CreatePlayerOrGroup = record
    dwType: DWORD;             // Message type
    dwPlayerType: DWORD;       // Is it a player or group
    dpId: TDPID;                // ID of the player or group
    dwCurrentPlayers: DWORD;   // current # players & groups in session
    lpData: Pointer;           // pointer to remote data
    dwDataSize: DWORD;         // size of remote data
    dpnName: TDPName;           // structure with name info
                               // the following fields are only available when using
                               // the IDirectPlay3 interface or greater
    dpIdParent: TDPID;          // id of parent group
    dwFlags: DWORD;            // player or group flags
  end;

  DPMSG_CREATEPLAYERORGROUP = TDPMsg_CreatePlayerOrGroup;
  LPDPMSG_CREATEPLAYERORGROUP = PDPMsg_CreatePlayerOrGroup;

{ TDPMsg_DestroyPlayerOrGroup }

  PDPMsg_DestroyPlayerOrGroup = ^TDPMsg_DestroyPlayerOrGroup;
  TDPMsg_DestroyPlayerOrGroup = record
    dwType: DWORD;             // Message type
    dwPlayerType: DWORD;       // Is it a player or group
    dpId: TDPID;                // player ID being deleted
    lpLocalData: Pointer;      // copy of players local data
    dwLocalDataSize: DWORD;    // sizeof local data
    lpRemoteData: Pointer;     // copy of players remote data
    dwRemoteDataSize: DWORD;   // sizeof remote data
                               // the following fields are only available when using
                               // the IDirectPlay3 interface or greater
    dpnName: TDPName;           // structure with name info
    dpIdParent: TDPID;          // id of parent group
    dwFlags: DWORD;            // player or group flags
  end;

  DPMSG_DESTROYPLAYERORGROUP = TDPMsg_DestroyPlayerOrGroup;
  LPDPMSG_DESTROYPLAYERORGROUP = PDPMsg_DestroyPlayerOrGroup;

{ TDPMsg_AddPlayerOrGroup }

  PDPMsg_AddPlayerOrGroup = ^TDPMsg_AddPlayerOrGroup;
  TDPMsg_AddPlayerOrGroup = record
    dwType: DWORD;      // Message type
    dpIdGroup: TDPID;    // group ID being added to
    dpIdPlayer: TDPID;   // player ID being added
  end;

  DPMSG_ADDPLAYERTOGROUP = TDPMsg_AddPlayerOrGroup;
  LPDPMSG_ADDPLAYERTOGROUP = PDPMsg_AddPlayerOrGroup;

{ TDPMsg_DeletePlayerFromGroup }

  TDPMsg_DeletePlayerFromGroup = TDPMsg_AddPlayerOrGroup;
  PDPMsg_DeletePlayerFromGroup = PDPMsg_AddPlayerOrGroup;

  DPMSG_DELETEPLAYERFROMGROUP = TDPMsg_DeletePlayerFromGroup;
  LPDPMSG_DELETEPLAYERFROMGROUP = PDPMsg_DeletePlayerFromGroup;

{ TDPMsg_AddGroupToGroup }

  PDPMsg_AddGroupToGroup = ^TDPMsg_AddGroupToGroup;
  TDPMsg_AddGroupToGroup = record
    dwType: DWORD;           // Message type
    dpIdParentGroup: TDPID;   // group ID being added to
    dpIdGroup: TDPID;         // group ID being added
  end;

  DPMSG_ADDGROUPTOGROUP = TDPMsg_AddGroupToGroup;
  LPDPMSG_ADDGROUPTOGROUP = PDPMsg_AddGroupToGroup;

{ TDPMsg_DeleteGroupFromGroup }

  TDPMsg_DeleteGroupFromGroup = TDPMsg_AddGroupToGroup;
  PDPMsg_DeleteGroupFromGroup = PDPMsg_AddGroupToGroup;

  DPMSG_DELETEGROUPFROMGROUP = TDPMsg_DeleteGroupFromGroup;
  LPDPMSG_DELETEGROUPFROMGROUP = PDPMsg_DeleteGroupFromGroup;

{ TDPMsg_SetPlayerOrGroupData }

  PDPMsg_SetPlayerOrGroupData = ^TDPMsg_SetPlayerOrGroupData;
  TDPMsg_SetPlayerOrGroupData = record
    dwType: DWORD;         // Message type
    dwPlayerType: DWORD;   // Is it a player or group
    dpId: TDPID;            // ID of player or group
    lpData: Pointer;       // pointer to remote data
    dwDataSize: DWORD;     // size of remote data
  end;

  DPMSG_SETPLAYERORGROUPDATA = TDPMsg_SetPlayerOrGroupData;
  LPDPMSG_SETPLAYERORGROUPDATA = PDPMsg_SetPlayerOrGroupData;

{ TDPMsg_SetPlayerOrGroupName }

  PDPMsg_SetPlayerOrGroupName = ^TDPMsg_SetPlayerOrGroupName;
  TDPMsg_SetPlayerOrGroupName = record
    dwType: DWORD;         // Message type
    dwPlayerType: DWORD;   // Is it a player or group
    dpId: TDPID;            // ID of player or group
    dpnName: TDPName;       // structure with new name info
  end;

  DPMSG_SETPLAYERORGROUPNAME = TDPMsg_SetPlayerOrGroupName;
  LPDPMSG_SETPLAYERORGROUPNAME = PDPMsg_SetPlayerOrGroupName;

{ TDPMsg_SetSessionDesc }

  PDPMsg_SetSessionDesc = ^TDPMsg_SetSessionDesc;
  TDPMsg_SetSessionDesc = record
    dwType: DWORD;            // Message type
    dpDesc: TDPSessionDesc2;   // Session desc
  end;

  DPMSG_SETSESSIONDESC = TDPMsg_SetSessionDesc;
  LPDPMSG_SETSESSIONDESC = PDPMsg_SetSessionDesc;

{ TDPMsg_Host }

  PDPMsg_Host = ^TDPMsg_Host;
  TDPMsg_Host = TDPMsg_Generic;

  DPMSG_HOST = TDPMsg_Host;
  LPDPMSG_HOST = PDPMsg_Host;

{ TDPMsg_SessionLost }

  PDPMsg_SessionLost = ^TDPMsg_SessionLost;
  TDPMsg_SessionLost = TDPMsg_Generic;

  DPMSG_SESSIONLOST = TDPMsg_SessionLost;
  LPDPMSG_SESSIONLOST = PDPMsg_SessionLost;

{ TDPMsg_SecureMessage }

  PDPMsg_SecureMessage = ^TDPMsg_SecureMessage;
  TDPMsg_SecureMessage = record
    dwType: DWORD;       // Message Type
    dwFlags: DWORD;      // Signed/Encrypted
    dpIdFrom: TDPID;      // ID of Sending Player
    lpData: Pointer;     // Player message
    dwDataSize: DWORD;   // Size of player message
  end;

  DPMSG_SECUREMESSAGE = TDPMsg_SecureMessage;
  LPDPMSG_SECUREMESSAGE = PDPMsg_SecureMessage;

{ TDPMsg_StartSession }

  PDPMsg_StartSession = ^TDPMsg_StartSession;
  TDPMsg_StartSession = record
    dwType: DWORD;             // Message type
    lpConn: PDPLConnection;    // TDPLConnection structure
  end;

  DPMSG_STARTSESSION = TDPMsg_StartSession;
  LPDPMSG_STARTSESSION = PDPMsg_StartSession;

{ TDPMsg_Chat }

  PDPMsg_Chat = ^TDPMsg_Chat;
  TDPMsg_Chat = record
    dwType: DWORD;        // Message type
    dwFlags: DWORD;       // Message flags
    idFromPlayer: TDPID;  // ID of the Sending Player
    idToPlayer: TDPID;    // ID of the To Player
    idToGroup: TDPID;     // ID of the To Group
    lpChat: PDPChat;      // Pointer to a structure containing the chat message
  end;

  DPMSG_CHAT = TDPMsg_Chat;
  LPDPMSG_CHAT = PDPMsg_Chat;

{ TDPMsg_SetGroupOwner }

  PDPMsg_SetGroupOwner = ^TDPMsg_SetGroupOwner;
  TDPMsg_SetGroupOwner = record
    dwType: DWORD;        // Message type
    idGroup: TDPID;       // ID of the group
    idNewOwner: TDPID;    // ID of the player that is the new owner
    idOldOwner: TDPID;    // ID of the player that used to be the owner
  end;

  DPMSG_SETGROUPOWNER = TDPMsg_SetGroupOwner;
  LPDPMSG_SETGROUPOWNER = PDPMsg_SetGroupOwner;

{ TDPMsg_SendComplete }

  PDPMsg_SendComplete= ^TDPMsg_SendComplete;
  TDPMsg_SendComplete = record
    dwType: DWORD;        // Message type
    idFrom: TDPID;
    idTo: TDPID;
    dwFlags: DWORD;
    dwTimeout: DWORD;
    lpvContext: Pointer;
    dwMsgID: DWORD;
    hr: HRESULT;
    dwSendTime: DWORD;
  end;

  DPMSG_SENDCOMPLETE = TDPMsg_SendComplete;
  LPDPMSG_SENDCOMPLETE = PDPMsg_SendComplete;

{ DIRECTPLAY ERRORS }
const
  DP_OK                         = S_OK;
  DPERR_ALREADYINITIALIZED      = $88770000 + 5;
  DPERR_ACCESSDENIED            = $88770000 + 10;
  DPERR_ACTIVEPLAYERS           = $88770000 + 20;
  DPERR_BUFFERTOOSMALL          = $88770000 + 30;
  DPERR_CANTADDPLAYER           = $88770000 + 40;
  DPERR_CANTCREATEGROUP         = $88770000 + 50;
  DPERR_CANTCREATEPLAYER        = $88770000 + 60;
  DPERR_CANTCREATESESSION       = $88770000 + 70;
  DPERR_CAPSNOTAVAILABLEYET     = $88770000 + 80;
  DPERR_EXCEPTION               = $88770000 + 90;
  DPERR_GENERIC                 = E_FAIL;
  DPERR_INVALIDFLAGS            = $88770000 + 120;
  DPERR_INVALIDOBJECT           = $88770000 + 130;
  DPERR_INVALIDPARAM            = E_INVALIDARG;
  DPERR_INVALIDPARAMS           = DPERR_INVALIDPARAM;
  DPERR_INVALIDPLAYER           = $88770000 + 150;
  DPERR_INVALIDGROUP            = $88770000 + 155;
  DPERR_NOCAPS                  = $88770000 + 160;
  DPERR_NOCONNECTION            = $88770000 + 170;
  DPERR_NOMEMORY                = E_OUTOFMEMORY;
  DPERR_OUTOFMEMORY             = DPERR_NOMEMORY;
  DPERR_NOMESSAGES              = $88770000 + 190;
  DPERR_NONAMESERVERFOUND       = $88770000 + 200;
  DPERR_NOPLAYERS               = $88770000 + 210;
  DPERR_NOSESSIONS              = $88770000 + 220;
  DPERR_PENDING                 = E_PENDING;
  DPERR_SENDTOOBIG              = $88770000 + 230;
  DPERR_TIMEOUT                 = $88770000 + 240;
  DPERR_UNAVAILABLE             = $88770000 + 250;
  DPERR_UNSUPPORTED             = E_NOTIMPL;
  DPERR_BUSY                    = $88770000 + 270;
  DPERR_USERCANCEL              = $88770000 + 280;
  DPERR_NOINTERFACE             = E_NOINTERFACE;
  DPERR_CANNOTCREATESERVER      = $88770000 + 290;
  DPERR_PLAYERLOST              = $88770000 + 300;
  DPERR_SESSIONLOST             = $88770000 + 310;
  DPERR_UNINITIALIZED           = $88770000 + 320;
  DPERR_NONEWPLAYERS            = $88770000 + 330;
  DPERR_INVALIDPASSWORD         = $88770000 + 340;
  DPERR_CONNECTING              = $88770000 + 350;
  DPERR_CONNECTIONLOST          = $88770000 + 360;
  DPERR_UNKNOWNMESSAGE          = $88770000 + 370;
  DPERR_CANCELFAILED            = $88770000 + 380;
  DPERR_INVALIDPRIORITY         = $88770000 + 390;
  DPERR_NOTHANDLED              = $88770000 + 400;
  DPERR_CANCELLED               = $88770000 + 410;
  DPERR_ABORTED                 = $88770000 + 420;
  DPERR_BUFFERTOOLARGE          = $88770000 + 1000;
  DPERR_CANTCREATEPROCESS       = $88770000 + 1010;
  DPERR_APPNOTSTARTED           = $88770000 + 1020;
  DPERR_INVALIDINTERFACE        = $88770000 + 1030;
  DPERR_NOSERVICEPROVIDER       = $88770000 + 1040;
  DPERR_UNKNOWNAPPLICATION      = $88770000 + 1050;
  DPERR_NOTLOBBIED              = $88770000 + 1070;
  DPERR_SERVICEPROVIDERLOADED   = $88770000 + 1080;
  DPERR_ALREADYREGISTERED       = $88770000 + 1090;
  DPERR_NOTREGISTERED           = $88770000 + 1100;

{ Security related errors }

  DPERR_AUTHENTICATIONFAILED    = $88770000 + 2000;
  DPERR_CANTLOADSSPI            = $88770000 + 2010;
  DPERR_ENCRYPTIONFAILED        = $88770000 + 2020;
  DPERR_SIGNFAILED              = $88770000 + 2030;
  DPERR_CANTLOADSECURITYPACKAGE = $88770000 + 2040;
  DPERR_ENCRYPTIONNOTSUPPORTED  = $88770000 + 2050;
  DPERR_CANTLOADCAPI            = $88770000 + 2060;
  DPERR_NOTLOGGEDIN             = $88770000 + 2070;
  DPERR_LOGONDENIED             = $88770000 + 2080;

// define this to ignore obsolete interfaces and constants

  DPOPEN_OPENSESSION   = DPOPEN_JOIN;
  DPOPEN_CREATESESSION = DPOPEN_CREATE;

  DPENUMSESSIONS_PREVIOUS = $00000004;

  DPENUMPLAYERS_PREVIOUS = $00000004;

  DPSEND_GUARANTEE = DPSEND_GUARANTEED;
  DPSEND_TRYONCE   = $00000004;

  DPCAPS_NAMESERVICE = $00000001;
  DPCAPS_NAMESERVER  = DPCAPS_ISHOST;
  DPCAPS_GUARANTEED  = $00000004;

  DPLONGNAMELEN    = 52;
  DPSHORTNAMELEN   = 20;
  DPSESSIONNAMELEN = 32;
  DPPASSWORDLEN    = 16;
  DPUSERRESERVED   = 16;

  DPSYS_ADDPLAYER    = $0003;
  DPSYS_DELETEPLAYER = $0005;

  DPSYS_DELETEGROUP         = $0020;
  DPSYS_DELETEPLAYERFROMGRP = $0021;
  DPSYS_CONNECT             = $484b;

{ TDPMsg_AddPlayer }

type
  PDPMsg_AddPlayer = ^TDPMsg_AddPlayer;
  TDPMsg_AddPlayer = record
    dwType: DWORD;
    dwPlayerType: DWORD;
    dpId: TDPID;
    szLongName: array[0..DPLONGNAMELEN-1] of Char;
    szShortName: array[0..DPSHORTNAMELEN-1] of Char;
    dwCurrentPlayers: DWORD;
  end;

  DPMSG_ADDPLAYER = TDPMsg_AddPlayer;
  LPDPMSG_ADDPLAYER = PDPMsg_AddPlayer;

{ TDPMsg_AddGroup }

  PDPMsg_AddGroup = ^TDPMsg_AddGroup;
  TDPMsg_AddGroup = TDPMsg_AddPlayer;

  DPMSG_ADDGROUP = TDPMsg_AddGroup;
  LPDPMSG_ADDGROUP = PDPMsg_AddGroup;

{ TDPMsg_GroupAdd }

  PDPMsg_GroupAdd = ^TDPMsg_GroupAdd;
  TDPMsg_GroupAdd = record
    dwType: DWORD;
    dpIdGroup: TDPID;
    dpIdPlayer: TDPID;
  end;

  DPMSG_GROUPADD = TDPMsg_GroupAdd;
  LPDPMSG_GROUPADD = PDPMsg_GroupAdd;

{ TDPMsg_GroupDelete }

  PDPMsg_GroupDelete = ^TDPMsg_GroupDelete;
  TDPMsg_GroupDelete = TDPMsg_GroupAdd;

  DPMSG_GROUPDELETE = TDPMsg_GroupDelete;
  LPDPMSG_GROUPDELETE = PDPMsg_GroupDelete;

{ TDPMsg_DeletePlayer }

  PDPMsg_DeletePlayer = ^TDPMsg_DeletePlayer;
  TDPMsg_DeletePlayer = record
    dwType: DWORD;
    dpId: TDPID;
  end;

  DPMSG_DELETEPLAYER = TDPMsg_DeletePlayer;
  LPDPMSG_DELETEPLAYER = PDPMsg_DeletePlayer;

{ TDPEnumPlayersCallback }

  TDPEnumPlayersCallback = function(dpId: TDPID; lpFriendlyName: LPSTR;
      lpFormalName: LPSTR; dwFlags: DWORD; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMPLAYERSCALLBACK = TDPEnumPlayersCallback;

{ TDPSessionDesc }

  PDPSessionDesc = ^TDPSessionDesc;
  TDPSessionDesc = record
    dwSize: DWORD;
    guidSession: TGUID;
    dwSession: DWORD;
    dwMaxPlayers: DWORD;
    dwCurrentPlayers: DWORD;
    dwFlags: DWORD;
    szSessionName: array[0..DPSESSIONNAMELEN-1] of char;
    szUserField: array[0..DPUSERRESERVED-1] of char;
    dwReserved1: DWORD;
    szPassword: array[0..DPPASSWORDLEN-1] of char;
    dwReserved2: DWORD;
    dwUser1: DWORD;
    dwUser2: DWORD;
    dwUser3: DWORD;
    dwUser4: DWORD;
  end;

  DPSESSIONDESC = TDPSessionDesc;
  LPDPSESSIONDESC = PDPSessionDesc;

{ TDPEnumSessionsCallback }

  TDPEnumSessionsCallback = function(var lpDPSessionDesc: TDPSessionDesc;
      lpContext: Pointer; var lpdwTimeOut: DWORD; dwFlags: DWORD): BOOL; stdcall;
  LPDPENUMSESSIONSCALLBACK = TDPEnumSessionsCallback;

type
  IDirectPlay = interface(IUnknown)
    // IDirectPlay methods
    function AddPlayerToGroup(pidGroup: TDPID; pidPlayer: TDPID): HResult; stdcall;
    function Close: HResult; stdcall;
    function CreatePlayer(var lppidID: TDPID; lpPlayerFriendlyName: LPSTR;
        lpPlayerFormalName: LPSTR; lpEvent: PHandle): HResult; stdcall;
    function CreateGroup(var lppidID: TDPID; lpGroupFriendlyName: LPSTR;
        lpGroupFormalName: LPSTR): HResult; stdcall;
    function DeletePlayerFromGroup(pidGroup: TDPID; pidPlayer: TDPID): HResult; stdcall;
    function DestroyPlayer(pidID: TDPID): HResult; stdcall;
    function DestroyGroup(pidID: TDPID): HResult; stdcall;
    function EnableNewPlayers(bEnable: BOOL): HResult; stdcall;
    function EnumGroupPlayers(pidGroupPID: TDPID; lpEnumPlayersCallback:
        LPDPENUMPLAYERSCALLBACK; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function EnumGroups(dwSessionID: DWORD; lpEnumPlayersCallback:
        LPDPENUMPLAYERSCALLBACK; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function EnumPlayers(dwSessionId: DWORD; lpEnumPlayersCallback:
        LPDPENUMPLAYERSCALLBACK; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function EnumSessions(const lpSDesc: TDPSessionDesc; dwTimeout: DWORD;
        lpEnumSessionsCallback: TDPEnumPlayersCallback; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function GetCaps(const lpDPCaps: TDPCaps): HResult; stdcall;
    function GetMessageCount(pidID: TDPID; var lpdwCount: DWORD): HResult; stdcall;
    function GetPlayerCaps(pidID: TDPID; const lpDPPlayerCaps: TDPCaps): HResult; stdcall;
    function GetPlayerName(pidID: TDPID; lpPlayerFriendlyName: LPSTR;
        var lpdwFriendlyNameLength: DWORD; lpPlayerFormalName: LPSTR;
        var lpdwFormalNameLength: DWORD): HResult; stdcall;
    function Initialize(const lpGUID: TGUID): HResult; stdcall;
    function Open(const lpSDesc: TDPSessionDesc): HResult; stdcall;
    function Receive(var lppidFrom, lppidTo: TDPID; dwFlags: DWORD;
        var lpvBuffer; var lpdwSize: DWORD): HResult; stdcall;
    function SaveSession(lpSessionName: LPSTR): HResult; stdcall;
    function Send(pidFrom: TDPID; pidTo: TDPID; dwFlags: DWORD;
        const lpvBuffer; dwBuffSize: DWORD): HResult; stdcall;
    function SetPlayerName(pidID: TDPID; lpPlayerFriendlyName: LPSTR;
        lpPlayerFormalName: LPSTR): HResult; stdcall;
  end;

{ API's (cont.) }

function DirectPlayCreate(const lpGUID: TGUID; out lplpDP: IDirectPlay;
    pUnk: IUnknown): HResult; stdcall;

(*==========================================================================;
 *
 *  Copyright (C) 1996-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dplobby.h
 *  Content:    DirectPlayLobby include file
 *
 ***************************************************************************)

{ GUIDS used by DirectPlay objects }

const
  CLSID_DirectPlayLobby: TGUID = '{2FE8F810-B2A5-11D0-A787-0000F803ABFC}';

  IID_IDirectPlayLobby: TGUID = '{AF465C71-9588-11cf-A020-00AA006157AC}';
  IID_IDirectPlayLobbyA: TGUID = '{26C66A70-B367-11cf-A024-00AA006157AC}';
  IID_IDirectPlayLobby2: TGUID = '{0194C220-A303-11d0-9C4F-00A0C905425E}';
  IID_IDirectPlayLobby2A: TGUID = '{1BB4AF80-A303-11d0-9C4F-00A0C905425E}';
  IID_IDirectPlayLobby3: TGUID = '{2DB72490-652C-11d1-A7A8-0000F803ABFC}';
  IID_IDirectPlayLobby3A: TGUID = '{2DB72491-652C-11d1-A7A8-0000F803ABFC}';

{ IDirectPlayLobby Structures }

{ TDPLAppInfo }

type
  PDPLAppInfo = ^TDPLAppInfo;
  TDPLAppInfo = record
    dwSize: DWORD;            // Size of this structure
    guidApplication: TGUID;   // GUID of the Application
    case Integer of           // Pointer to the Application Name
      0: (lpszAppNameA: LPSTR);
      1: (lpszAppName: LPWSTR);
  end;

  DPLAPPINFO = TDPLAppInfo;
  LPDPLAPPINFO = PDPLAppInfo;

{ TDPCompoundAddressElement }

  PDPCompoundAddressElement = ^TDPCompoundAddressElement;
  TDPCompoundAddressElement = record
    guidDataType: TGUID;
    dwDataSize: DWORD;
    lpData: Pointer;
  end;

  DPCOMPOUNDADDRESSELEMENT = TDPCompoundAddressElement;
  LPDPCOMPOUNDADDRESSELEMENT = PDPCompoundAddressElement;

{ TDPApplicationDesc }

  PDPApplicationDesc = ^TDPApplicationDesc;
  TDPApplicationDesc = record
    dwSize: DWORD;
    dwFlags: DWORD;
    case Integer of
      0: (
        lpszApplicationNameA: LPSTR;  // ANSI
        lpszFilenameA: LPSTR;
        lpszCommandLineA: LPSTR;
        lpszPathA: LPSTR;
        lpszCurrentDirectoryA: LPSTR;
        lpszDescriptionA: LPSTR;
        );
      1: (
        lpszApplicationName: LPWSTR;  // Unicode
        lpszFilename: LPWSTR;
        lpszCommandLine: LPWSTR;
        lpszPath: LPWSTR;
        lpszCurrentDirectory: LPWSTR;
        lpszDescription: LPWSTR;
        );
  end;

  DPAPPLICATIONDESC = TDPApplicationDesc;
  LPDPAPPLICATIONDESC = PDPApplicationDesc;

{ Enumeration Method Callback Prototypes }

  TDPEnumAddressCallback = function(const guidDataType: TGUID;
      dwDataSize: DWORD; lpData: Pointer; lpContext: Pointer): BOOL; stdcall;
  LPDPENUMADDRESSCALLBACK = TDPEnumAddressCallback;

  TDPLEnumAddressTypesCallback = function(const guidDataType: TGUID;
      lpContext: Pointer; dwFlags: DWORD): BOOL; stdcall;
  LPDPLENUMADDRESSTYPESCALLBACK = TDPLEnumAddressTypesCallback;

  TDPLEnumLocalApplicationsCallback = function(const lpAppInfo: TDPLAppInfo;
      lpContext: Pointer; dwFlags: DWORD): BOOL; stdcall;
  LPDPLENUMLOCALAPPLICATIONSCALLBACK = TDPLEnumLocalApplicationsCallback;

{ IDirectPlayLobby (and IDirectPlayLobbyA) Interface }

type
  IDirectPlayLobby = interface(IUnknown)
    ['{AF465C71-9588-11CF-A020-00AA006157AC}']
    // IDirectPlayLobby methods
    function Connect(dwFlags: DWORD; out lplpDP: IDirectPlay2;
        pUnk: IUnknown): HResult; stdcall;
    function CreateAddress(const guidSP, guidDataType: TGUID; const lpData;
        dwDataSize: DWORD; var lpAddress; var lpdwAddressSize: DWORD): HResult; stdcall;
    function EnumAddress(lpEnumAddressCallback: TDPEnumAddressCallback;
        const lpAddress; dwAddressSize: DWORD; lpContext : Pointer): HResult; stdcall;
    function EnumAddressTypes(lpEnumAddressTypeCallback:
        TDPLEnumAddressTypesCallback; const guidSP: TGUID; lpContext: Pointer;
        dwFlags: DWORD): HResult; stdcall;
    function EnumLocalApplications(lpEnumLocalAppCallback:
        TDPLEnumLocalApplicationsCallback; lpContext: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetConnectionSettings(dwAppID: DWORD; var lpData: TDPLConnection;
        var lpdwDataSize: DWORD): HResult; stdcall;
    function ReceiveLobbyMessage(dwFlags: DWORD; dwAppID: DWORD;
        var lpdwMessageFlags: DWORD; var lpData; var lpdwDataSize: DWORD): HResult; stdcall;
    function RunApplication(dwFlags: DWORD; var lpdwAppId: DWORD;
        const lpConn: TDPLConnection; hReceiveEvent: THandle): HResult; stdcall;
    function SendLobbyMessage(dwFlags: DWORD; dwAppID: DWORD; const lpData;
        dwDataSize: DWORD): HResult; stdcall;
    function SetConnectionSettings(dwFlags: DWORD; dwAppID: DWORD;
        const lpConn: TDPLConnection): HResult; stdcall;
    function SetLobbyMessageEvent(dwFlags: DWORD; dwAppID: DWORD;
        hReceiveEvent: THandle): HResult; stdcall;
  end;

  IDirectPlayLobbyA = interface(IDirectPlayLobby)
    ['{26C66A70-B367-11CF-A024-00AA006157AC}']
  end;

{ IDirectPlayLobby2 (and IDirectPlayLobby2A) Interface }

  IDirectPlayLobby2 = interface(IDirectPlayLobby)
    ['{0194C220-A303-11D0-9C4F-00A0C905425E}']
    // IDirectPlayLobby2 methods
    function CreateCompoundAddress(const lpElements: TDPCompoundAddressElement;
        dwElementCount: DWORD; var lpAddress; var lpdwAddressSize: DWORD): HResult; stdcall;
  end;

  IDirectPlayLobby2A = interface(IDirectPlayLobby2)
    ['{1BB4AF80-A303-11D0-9C4F-00A0C905425E}']
  end;

{ IDirectPlayLobby3 (and IDirectPlayLobby3A) Interface }

  IDirectPlayLobby3 = interface(IDirectPlayLobby2)
    ['{2DB72490-652C-11d1-A7A8-0000F803ABFC}']
    // IDirectPlayLobby3 Methods
    function ConnectEx(dwFlags: DWORD; const riid: TGUID; var lplpDP: Pointer;
        pUnk: IUnknown): HResult; stdcall;
    function RegisterApplication(dwFlags: DWORD; const lpAppDesc: TDPApplicationDesc): HResult; stdcall;
    function UnRegisterApplication(dwFlags: DWORD; const guidApplication: TGUID): HResult; stdcall;
    function WaitForConnectionSettings(dwFlags: DWORD): HResult; stdcall;
  end;

  IDirectPlayLobby3A = interface(IDirectPlayLobby3)
    ['{2DB72491-652C-11d1-A7A8-0000F803ABFC}']
  end;

{ DirectPlayLobby API Prototypes }

function DirectPlayLobbyCreateW(const lpguidSP: TGUID; out lplpDPL: IDirectPlayLobby;
    lpUnk: IUnknown; lpData: Pointer; dwDataSize: DWORD): HResult; stdcall;
function DirectPlayLobbyCreateA(const lpguidSP: TGUID; out lplpDPL: IDirectPlayLobbyA;
    lpUnk: IUnknown; lpData: Pointer; dwDataSize: DWORD): HResult; stdcall;
function DirectPlayLobbyCreate(const lpguidSP: TGUID; out lplpDPL: IDirectPlayLobbyA;
    lpUnk: IUnknown; lpData: Pointer; dwDataSize: DWORD): HResult; stdcall;

{ DirectPlayLobby Flags }

const
  DPLWAIT_CANCEL  = $00000001;

  DPLMSG_SYSTEM   = $00000001;
  DPLMSG_STANDARD = $00000002;


{ DirectPlayLobby messages and message data structures }

{ TDPLMsg_Generic }

type
  PDPLMsg_Generic = ^TDPLMsg_Generic;
  TDPLMsg_Generic = record
    dwType: DWORD;   // Message type
  end;

  DPLMSG_GENERIC = TDPLMsg_Generic;
  LPDPLMSG_GENERIC = PDPLMsg_Generic;

{ TDPLMsg_SystemMessage }

  PDPLMsg_SystemMessage = ^TDPLMsg_SystemMessage;
  TDPLMsg_SystemMessage = record
    dwType: DWORD;        // Message type
    guidInstance: TGUID;  // Instance GUID of the dplay session the message corresponds to
  end;

  DPLMSG_SYSTEMMESSAGE = TDPLMsg_SystemMessage;
  LPDPLMSG_SYSTEMMESSAGE = PDPLMsg_SystemMessage;

{ TDPLMsg_SetProperty }

  PDPLMsg_SetProperty = ^TDPLMsg_SetProperty;
  TDPLMsg_SetProperty = record
    dwType: DWORD;                           // Message type
    dwRequestID: DWORD;                      // Request ID (DPL_NOCONFIRMATION if no confirmation desired)
    guidPlayer: TGUID;                       // Player GUID
    guidPropertyTag: TGUID;                  // Property GUID
    dwDataSize: DWORD;                       // Size of data
    dwPropertyData: array[0..0] of DWORD;   // Buffer containing data
  end;

  DPLMSG_SETPROPERTY = TDPLMsg_SetProperty;
  LPDPLMSG_SETPROPERTY = PDPLMsg_SetProperty;

const
  DPL_NOCONFIRMATION = 0;

{ TDPLMsg_SetPropertyResponse }

type
  PDPLMsg_SetPropertyResponse = ^TDPLMsg_SetPropertyResponse;
  TDPLMsg_SetPropertyResponse = record
    dwType: DWORD;            // Message type
    dwRequestID: DWORD;       // Request ID
    guidPlayer: TGUID;        // Player GUID
    guidPropertyTag: TGUID;   // Property GUID
    hr: HResult;              // Return Code
  end;

  DPLMSG_SETPROPERTYRESPONSE = TDPLMsg_SetPropertyResponse;
  LPDPLMSG_SETPROPERTYRESPONSE = PDPLMsg_SetPropertyResponse;

{ TDPLMsg_GetProperty }

  PDPLMsg_GetProperty = ^TDPLMsg_GetProperty;
  TDPLMsg_GetProperty = record
    dwType: DWORD;            // Message type
    dwRequestID: DWORD;       // Request ID
    guidPlayer: TGUID;        // Player GUID
    guidPropertyTag: TGUID;   // Property GUID
  end;

  DPLMSG_GETPROPERTY = TDPLMsg_GetProperty;
  LPDPLMSG_GETPROPERTY = PDPLMsg_GetProperty;

{ TDPLMsg_GetPropertyResponse }

  PDPLMsg_GetPropertyResponse = ^TDPLMsg_GetPropertyResponse;
  TDPLMsg_GetPropertyResponse = record
    dwType: DWORD;                           // Message type
    dwRequestID: DWORD;                      // Request ID
    guidPlayer: TGUID;                       // Player GUID
    guidPropertyTag: TGUID;                  // Property GUID
    hr: HResult;                             // Return Code
    dwDataSize: DWORD;                       // Size of data
    dwPropertyData: array[0..0] of DWORD;    // Buffer containing data
  end;

  DPLMSG_GETPROPERTYRESPONSE = TDPLMsg_GetPropertyResponse;
  LPDPLMSG_GETPROPERTYRESPONSE = PDPLMsg_GetPropertyResponse;

{ TDPLMsg_NewSessionHost }

  PDPLMsg_NewSessionHost = ^TDPLMsg_NewSessionHost;
  TDPLMsg_NewSessionHost = record
    dwType: DWORD;            // Message type
    guidInstance: TGUID;      // GUID Instance of the session
  end;

  DPLMSG_NEWSESSIONHOST = TDPLMsg_NewSessionHost;
  LPDPLMSG_NEWSESSIONHOST = PDPLMsg_NewSessionHost;

{ DirectPlay Lobby message dwType values }

const
  DPLSYS_CONNECTIONSETTINGSREAD = $00000001;
  DPLSYS_DPLAYCONNECTFAILED     = $00000002;
  DPLSYS_DPLAYCONNECTSUCCEEDED  = $00000003;
  DPLSYS_APPTERMINATED          = $00000004;
  DPLSYS_SETPROPERTY            = $00000005;
  DPLSYS_SETPROPERTYRESPONSE    = $00000006;
  DPLSYS_GETPROPERTY            = $00000007;
  DPLSYS_GETPROPERTYRESPONSE    = $00000008;
  DPLSYS_NEWSESSIONHOST         = $00000009;
  DPLSYS_NEWCONNECTIONSETTINGS  = $0000000A;

{ DirectPlay defined property GUIDs and associated data structures }

  DPLPROPERTY_MessagesSupported: TGUID = '{762CCDA1-D916-11d0-BA39-00C04FD7ED67}';
  DPLPROPERTY_LobbyGuid: TGUID = '{F56920A0-D218-11d0-BA39-00C04FD7ED67}';
  DPLPROPERTY_PlayerGuid: TGUID = '{B4319322-D20D-11d0-BA39-00C04FD7ED67}';

{ TDPLData_PlayerGUID }

type
  PDPLData_PlayerGUID = ^TDPLData_PlayerGUID;
  TDPLData_PlayerGUID = record
    guidPlayer: TGUID;
    dwPlayerFlags: DWORD;
  end;

  DPLDATA_PLAYERGUID = TDPLData_PlayerGUID;
  LPDPLDATA_PLAYERGUID = PDPLData_PlayerGUID;

{ DPLPROPERTY_PlayerScore }

const
  DPLPROPERTY_PlayerScore: TGUID = '{48784000-D219-11d0-BA39-00C04FD7ED67}';

{ TDPLData_PlayerScore }

type
  PDPLData_PlayerScore = ^TDPLData_PlayerScore;
  TDPLData_PlayerScore = record
    dwScoreCount: DWORD;
    Score: array[0..0] of Longint;
  end;

  DPLDATA_PLAYERSCORE = TDPLData_PlayerScore;
  LPDPLDATA_PLAYERSCORE = PDPLData_PlayerScore;

{ DirectPlay Address ID's }

type
  PDPAddress = ^TDPAddress;
  TDPAddress = record
    guidDataType: TGUID;
    dwDataSize: DWORD;
  end;

  DPADDRESS = TDPAddress;
  LPDPADDRESS = PDPAddress;

const
  DPAID_TotalSize: TGUID = '{1318F560-912C-11d0-9DAA-00A0C90A43CB}';
  DPAID_ServiceProvider: TGUID = '{07D916C0-E0AF-11cf-9C4E-00A0C905425E}';
  DPAID_LobbyProvider: TGUID = '{59B95640-9667-11d0-A77D-0000F803ABFC}';
  DPAID_Phone: TGUID = '{78EC89A0-E0AF-11cf-9C4E-00A0C905425E}';
  DPAID_PhoneW: TGUID = '{BA5A7A70-9DBF-11d0-9CC1-00A0C905425E}';
  DPAID_Modem: TGUID = '{F6DCC200-A2FE-11d0-9C4F-00A0C905425E}';
  DPAID_ModemW: TGUID = '{01FD92E0-A2FF-11d0-9C4F-00A0C905425E}';
  DPAID_INet: TGUID = '{C4A54DA0-E0AF-11cf-9C4E-00A0C905425E}';
  DPAID_INetW: TGUID = '{E63232A0-9DBF-11d0-9CC1-00A0C905425E}';
  DPAID_INetPort: TGUID = '{E4524541-8EA5-11d1-8A96-006097B01411}';
  DPAID_MaxMessageSize: TGUID = '{F5D09980-F0C4-11d1-8326-006097B01411}';

{ TDPComPortAddress }

const

  DPCPA_NOFLOW      = 0;  // no flow control
  DPCPA_XONXOFFFLOW = 1;  // software flow control
  DPCPA_RTSFLOW     = 2;  // hardware flow control with RTS
  DPCPA_DTRFLOW     = 3;  // hardware flow control with DTR
  DPCPA_RTSDTRFLOW  = 4;  // hardware flow control with RTS and DTR

type
  PDPComPortAddress = ^TDPComPortAddress;
  TDPComPortAddress = record
    dwComPort: DWORD;       // COM port to use (1-4)
    dwBaudRate: DWORD;      // baud rate (100-256k)
    dwStopBits: DWORD;      // no. stop bits (1-2)
    dwParity: DWORD;        // parity (none, odd, even, mark)
    dwFlowControl: DWORD;   // flow control (none, xon/xoff, rts, dtr)
  end;

  DPCOMPORTADDRESS = TDPComPortAddress;
  LPDPCOMPORTADDRESS = PDPComPortAddress;

const
  DPAID_ComPort: TGUID = '{F2F0CE00-E0AF-11cf-9C4E-00A0C905425E}';

{ dplobby 1.0 obsolete definitions }

  DPLAD_SYSTEM = DPLMSG_SYSTEM;

(*==========================================================================
 *
 *  Copyright (C) 1995-1997 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dsetup.h
 *  Content:    DirectXSetup, error codes and flags
 *
 ***************************************************************************)

// DSETUP Error Codes, must remain compatible with previous setup.
const
  DSETUPERR_SUCCESS_RESTART     = 1;
  DSETUPERR_SUCCESS             = 0;
  DSETUPERR_BADWINDOWSVERSION   = -1;
  DSETUPERR_SOURCEFILENOTFOUND  = -2;
  DSETUPERR_BADSOURCESIZE       = -3;
  DSETUPERR_BADSOURCETIME       = -4;
  DSETUPERR_NOCOPY              = -5;
  DSETUPERR_OUTOFDISKSPACE      = -6;
  DSETUPERR_CANTFINDINF         = -7;
  DSETUPERR_CANTFINDDIR         = -8;
  DSETUPERR_INTERNAL            = -9;
  DSETUPERR_UNKNOWNOS           = -11;
  DSETUPERR_USERHITCANCEL       = -12;
  DSETUPERR_NOTPREINSTALLEDONNT = -13;

// DSETUP flags. DirectX 5.0 apps should use these flags only.
  DSETUP_DDRAWDRV     = $00000008;   (* install DirectDraw Drivers           *)
  DSETUP_DSOUNDDRV    = $00000010;   (* install DirectSound Drivers          *)
  DSETUP_DXCORE       = $00010000;   (* install DirectX runtime              *)
  DSETUP_DIRECTX = DSETUP_DXCORE or DSETUP_DDRAWDRV or DSETUP_DSOUNDDRV;
  DSETUP_TESTINSTALL  = $00020000;   (* just test install, don't do anything *)

// These OBSOLETE flags are here for compatibility with pre-DX5 apps only.
// They are present to allow DX3 apps to be recompiled with DX5 and still work.
// DO NOT USE THEM for DX5. They will go away in future DX releases.

  DSETUP_DDRAW         = $00000001; (* OBSOLETE. install DirectDraw           *)
  DSETUP_DSOUND        = $00000002; (* OBSOLETE. install DirectSound          *)
  DSETUP_DPLAY         = $00000004; (* OBSOLETE. install DirectPlay           *)
  DSETUP_DPLAYSP       = $00000020; (* OBSOLETE. install DirectPlay Providers *)
  DSETUP_DVIDEO        = $00000040; (* OBSOLETE. install DirectVideo          *)
  DSETUP_D3D           = $00000200; (* OBSOLETE. install Direct3D             *)
  DSETUP_DINPUT        = $00000800; (* OBSOLETE. install DirectInput          *)
  DSETUP_DIRECTXSETUP  = $00001000; (* OBSOLETE. install DirectXSetup DLL's   *)
  DSETUP_NOUI          = $00002000; (* OBSOLETE. install DirectX with NO UI   *)
  DSETUP_PROMPTFORDRIVERS = $10000000; (* OBSOLETE. prompt when replacing display/audio drivers *)
  DSETUP_RESTOREDRIVERS = $20000000;(* OBSOLETE. restore display/audio drivers *)

//******************************************************************
// DirectX Setup Callback mechanism
//******************************************************************

// DSETUP Message Info Codes, passed to callback as Reason parameter.
  DSETUP_CB_MSG_NOMESSAGE                 = 0;
  DSETUP_CB_MSG_CANTINSTALL_UNKNOWNOS     = 1;
  DSETUP_CB_MSG_CANTINSTALL_NT            = 2;
  DSETUP_CB_MSG_CANTINSTALL_BETA          = 3;
  DSETUP_CB_MSG_CANTINSTALL_NOTWIN32      = 4;
  DSETUP_CB_MSG_CANTINSTALL_WRONGLANGUAGE = 5;
  DSETUP_CB_MSG_CANTINSTALL_WRONGPLATFORM = 6;
  DSETUP_CB_MSG_PREINSTALL_NT             = 7;
  DSETUP_CB_MSG_NOTPREINSTALLEDONNT       = 8;
  DSETUP_CB_MSG_SETUP_INIT_FAILED         = 9;
  DSETUP_CB_MSG_INTERNAL_ERROR            = 10;
  DSETUP_CB_MSG_CHECK_DRIVER_UPGRADE      = 11;
  DSETUP_CB_MSG_OUTOFDISKSPACE            = 12;
  DSETUP_CB_MSG_BEGIN_INSTALL             = 13;
  DSETUP_CB_MSG_BEGIN_INSTALL_RUNTIME     = 14;
  DSETUP_CB_MSG_BEGIN_INSTALL_DRIVERS     = 15;
  DSETUP_CB_MSG_BEGIN_RESTORE_DRIVERS     = 16;
  DSETUP_CB_MSG_FILECOPYERROR             = 17;


  DSETUP_CB_UPGRADE_TYPE_MASK      = $000F;
  DSETUP_CB_UPGRADE_KEEP           = $0001;
  DSETUP_CB_UPGRADE_SAFE           = $0002;
  DSETUP_CB_UPGRADE_FORCE          = $0004;
  DSETUP_CB_UPGRADE_UNKNOWN        = $0008;

  DSETUP_CB_UPGRADE_HASWARNINGS    = $0100;
  DSETUP_CB_UPGRADE_CANTBACKUP     = $0200;

  DSETUP_CB_UPGRADE_DEVICE_ACTIVE  = $0800;

  DSETUP_CB_UPGRADE_DEVICE_DISPLAY = $1000;
  DSETUP_CB_UPGRADE_DEVICE_MEDIA   = $2000;

{ TDSetup_CB_UpgradeInfo }

type
  PDSetup_CB_UpgradeInfo = ^TDSetup_CB_UpgradeInfo;
  TDSetup_CB_UpgradeInfo = record
    UpgradeFlags: DWORD;
  end;

  DSETUP_CB_UPGRADEINFO = TDSetup_CB_UpgradeInfo;
  LPDSETUP_CB_UPGRADEINFO = PDSetup_CB_UpgradeInfo;

{ TDSetup_CB_FileCopyError }

  PDSetup_CB_FileCopyError = ^TDSetup_CB_FileCopyError;
  TDSetup_CB_FileCopyError = record
    dwError: DWORD;
  end;

  DSETUP_CB_FILECOPYERROR = TDSetup_CB_FileCopyError;
  LPDSETUP_CB_FILECOPYERROR = PDSetup_CB_FileCopyError;

//
// Data Structures
//

{ TDirectXRegisterAppA }

  PDirectXRegisterAppA = ^TDirectXRegisterAppA;
  TDirectXRegisterAppA = record
    dwSize: DWORD;
    dwFlags: DWORD;
    lpszApplicationName: PAnsiChar;
    lpGUID: PGUID;
    lpszFilename: PAnsiChar;
    lpszCommandLine: PAnsiChar;
    lpszPath: PAnsiChar;
    lpszCurrentDirectory: PAnsiChar;
  end;

  DIRECTXREGISTERAPPA = TDirectXRegisterAppA;
  LPDIRECTXREGISTERAPPA = PDirectXRegisterAppA;

{ TDirectXRegisterAppW }

  PDirectXRegisterAppW = ^TDirectXRegisterAppW;
  TDirectXRegisterAppW = record
    dwSize: DWORD;
    dwFlags: DWORD;
    lpszApplicationName: PWideChar;
    lpGUID: PGUID;
    lpszFilename: PWideChar;
    lpszCommandLine: PWideChar;
    lpszPath: PWideChar;
    lpszCurrentDirectory: PWideChar;
  end;

  DIRECTXREGISTERAPPW = TDirectXRegisterAppW;
  LPDIRECTXREGISTERAPPW = PDirectXRegisterAppW;

{ TDirectXRegisterApp }

  PDirectXRegisterApp = ^TDirectXRegisterApp;
  TDirectXRegisterApp = TDirectXRegisterAppA;

  DIRECTXREGISTERAPP = TDirectXRegisterApp;
  LPDIRECTXREGISTERAPP = PDirectXRegisterApp;

{ API }

function DirectXSetupA(hWnd: HWND; lpszRootPath: PAnsiChar; dwFlags: DWORD): Longint; stdcall;
function DirectXSetupW(hWnd: HWND; lpszRootPath: PWideChar; dwFlags: DWORD): Longint; stdcall;
function DirectXSetup(hWnd: HWND; lpszRootPath: PAnsiChar; dwFlags: DWORD): Longint; stdcall;

function DirectXDeviceDriverSetupA(hWnd: HWND; lpszDriverClass: PAnsiChar;
    lpszDriverPath: PAnsiChar; dwFlags: DWORD): Longint; stdcall;
function DirectXDeviceDriverSetupW(hWnd: HWND; lpszDriverClass: PWideChar;
    lpszDriverPath: PWideChar; dwFlags: DWORD): Longint; stdcall;
function DirectXDeviceDriverSetup(hWnd: HWND; lpszDriverClass: PAnsiChar;
    lpszDriverPath: PAnsiChar; dwFlags: DWORD): Longint; stdcall;

function DirectXRegisterApplicationA(hWnd: HWND; const lpDXRegApp: TDirectXRegisterAppA): Longint; stdcall;
function DirectXRegisterApplicationW(hWnd: HWND; const lpDXRegApp: TDirectXRegisterAppW): Longint; stdcall;
function DirectXRegisterApplication(hWnd: HWND; const lpDXRegApp: TDirectXRegisterAppA): Longint; stdcall;
function DirectXUnRegisterApplication(hWnd: HWND; const lpGUID: TGUID): Longint; stdcall;

type
  TDSetup_Callback = function (Reason: DWORD; MsgType: DWORD;
      szMessage: PAnsiChar; szName: PAnsiChar; pInfo: Pointer): DWORD; stdcall;
  DSETUP_CALLBACK = TDSetup_Callback;

function DirectXSetupSetCallback(Callback: TDSetup_Callback): Longint; stdcall;
function DirectXSetupGetVersion(var lpdwVersion, lpdwMinorVersion: DWORD): Longint; stdcall;

(*==========================================================================;
 *
 *  Copyright (C) 1995,1996 Microsoft Corporation.  All Rights Reserved.
 *
 *  File:       dsound.h
 *  Content:    DirectSound include file
 *
 **************************************************************************)

{ GUIDS used by DirectDraw objects }

const
  CLSID_DirectSound: TGUID = '{47D4D946-62E8-11cf-93BC-444553540000}';
  CLSID_DirectSoundCapture: TGUID = '{B0210780-89CD-11d0-AF08-00A0C925CD16}';

  IID_IDirectSound: TGUID = '{279AFA83-4981-11CE-A521-0020AF0BE560}';
  IID_IDirectSoundBuffer: TGUID = '{279AFA85-4981-11CE-A521-0020AF0BE560}';
  IID_IDirectSound3DListener: TGUID = '{279AFA84-4981-11CE-A521-0020AF0BE560}';
  IID_IDirectSound3DBuffer: TGUID = '{279AFA86-4981-11CE-A521-0020AF0BE560}';
  IID_IDirectSoundCapture: TGUID = '{B0210781-89CD-11D0-AF08-00A0C925CD16}';
  IID_IDirectSoundCaptureBuffer: TGUID = '{B0210782-89CD-11D0-AF08-00A0C925CD16}';

  IID_IDirectSoundNotify: TGUID = '{B0210783-89CD-11D0-AF08-00A0C925CD16}';

{ DirectSound Structures }

type
  IDirectSound = interface;
  IDirectSoundBuffer = interface;
  IDirectSound3DListener = interface;
  IDirectSound3DBuffer = interface;
  IDirectSoundCapture = interface;
  IDirectSoundCaptureBuffer = interface;
  IDirectSoundNotify = interface;

{ TDSCaps }

  PDSCaps = ^TDSCaps;
  TDSCaps = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwMinSecondarySampleRate: DWORD;
    dwMaxSecondarySampleRate: DWORD;
    dwPrimaryBuffers: DWORD;
    dwMaxHwMixingAllBuffers: DWORD;
    dwMaxHwMixingStaticBuffers: DWORD;
    dwMaxHwMixingStreamingBuffers: DWORD;
    dwFreeHwMixingAllBuffers: DWORD;
    dwFreeHwMixingStaticBuffers: DWORD;
    dwFreeHwMixingStreamingBuffers: DWORD;
    dwMaxHw3DAllBuffers: DWORD;
    dwMaxHw3DStaticBuffers: DWORD;
    dwMaxHw3DStreamingBuffers: DWORD;
    dwFreeHw3DAllBuffers: DWORD;
    dwFreeHw3DStaticBuffers: DWORD;
    dwFreeHw3DStreamingBuffers: DWORD;
    dwTotalHwMemBytes: DWORD;
    dwFreeHwMemBytes: DWORD;
    dwMaxContigFreeHwMemBytes: DWORD;
    dwUnlockTransferRateHwBuffers: DWORD;
    dwPlayCpuOverheadSwBuffers: DWORD;
    dwReserved1: DWORD;
    dwReserved2: DWORD;
  end;

  DSCAPS = TDSCaps;
  LPDSCAPS = PDSCaps;

{ TDSBCaps }

  PDSBCaps = ^TDSBCaps;
  TDSBCaps = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwBufferBytes: DWORD;
    dwUnlockTransferRate: DWORD;
    dwPlayCpuOverhead: DWORD;
  end;

  DSBCAPS = TDSBCaps;
  LPDSBCAPS = DSBCAPS;

{ TDSBufferDesc }

  PDSBufferDesc = ^TDSBufferDesc;
  TDSBufferDesc = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwBufferBytes: DWORD;
    dwReserved: DWORD;
    lpwfxFormat: PWaveFormatEx;
  end;

  DSBUFFERDESC = TDSBufferDesc;
  LPDSBUFFERDESC = PDSBufferDesc;

{ TDS3DBuffer }

  PDS3DBuffer = ^TDS3DBuffer;
  TDS3DBuffer = record
    dwSize: DWORD;
    vPosition: TD3DVector;
    vVelocity: TD3DVector;
    dwInsideConeAngle: DWORD;
    dwOutsideConeAngle: DWORD;
    vConeOrientation: TD3DVector;
    lConeOutsideVolume: Longint;
    flMinDistance: TD3DValue;
    flMaxDistance: TD3DValue;
    dwMode: DWORD;
  end;

  DS3DBUFFER = TDS3DBuffer;
  LPDS3DBUFFER = PDS3DBuffer;

{ TDS3DListener }

  PDS3DListener = ^TDS3DListener;
  TDS3DListener = record
    dwSize: DWORD;
    vPosition: TD3DVector;
    vVelocity: TD3DVector;
    vOrientFront: TD3DVector;
    vOrientTop: TD3DVector;
    flDistanceFactor: TD3DValue;
    flRolloffFactor: TD3DValue;
    flDopplerFactor: TD3DValue;
  end;

  DS3DLISTENER = TDS3DListener;
  LPDS3DLISTENER = PDS3DListener;

{ TDSCCaps }

  PDSCCaps = ^TDSCCaps;
  TDSCCaps = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwFormats: DWORD;
    dwChannels: DWORD;
  end;

  DSCCAPS = TDSCCaps;
  LPDSCCAPS = PDSCCaps;

{ TDSCBufferDesc }

  PDSCBufferDesc = ^TDSCBufferDesc;
  TDSCBufferDesc = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwBufferBytes: DWORD;
    dwReserved: DWORD;
    lpwfxFormat: PWaveFormatEx;
  end;

  DSCBUFFERDESC = TDSCBufferDesc;
  LPDSCBUFFERDESC = PDSCBufferDesc;

{ TDSCBCaps }

  PDSCBCaps = ^TDSCBCaps;
  TDSCBCaps = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwBufferBytes: DWORD;
    dwReserved: DWORD;
  end;

  DSCBCAPS = TDSCBCaps;
  LPDSCBCAPS = PDSCBCaps;

{ TDSBPositionNotify }

  PDSBPositionNotify = ^TDSBPositionNotify;
  TDSBPositionNotify = record
    dwOffset: DWORD;
    hEventNotify: THandle;
  end;

  DSBPOSITIONNOTIFY = TDSBPositionNotify;
  LPDSBPOSITIONNOTIFY = PDSBPositionNotify;

{ IDirectSound }

  IDirectSound = interface(IUnknown)
    ['{279AFA83-4981-11CE-A521-0020AF0BE560}']
    // IDirectSound methods
    function CreateSoundBuffer(const lpDSBufferDesc: TDSBufferDesc;
        out lplpDirectSoundBuffer: IDirectSoundBuffer;
        pUnkOuter: IUnknown): HResult; stdcall;
    function GetCaps(var lpDSCaps: TDSCaps): HResult; stdcall;
    function DuplicateSoundBuffer(lpDsbOriginal: IDirectSoundBuffer;
        out lpDsbDuplicate: IDirectSoundBuffer): HResult; stdcall;
    function SetCooperativeLevel(hwnd: HWND; dwLevel: DWORD): HResult; stdcall;
    function Compact: HResult; stdcall;
    function GetSpeakerConfig(var lpdwSpeakerConfig: DWORD): HResult; stdcall;
    function SetSpeakerConfig(dwSpeakerConfig: DWORD): HResult; stdcall;
    function Initialize(lpGuid: PGUID): HResult; stdcall;
  end;

{ IDirectSoundBuffer }

  IDirectSoundBuffer = interface(IUnknown)
    ['{279AFA85-4981-11CE-A521-0020AF0BE560}']
    // IDirectSoundBuffer methods
    function GetCaps(var lpDSBufferCaps: TDSBCaps): HResult; stdcall;
    function GetCurrentPosition(var lpdwCurrentPlayCursor,
        lpdwCurrentWriteCursor: DWORD): HResult; stdcall;
    function GetFormat(var lpwfxFormat: TWaveFormatEx; dwSizeAllocated: DWORD;
        var lpdwSizeWritten: DWORD): HResult; stdcall;
    function GetVolume(var lplVolume: Longint): HResult; stdcall;
    function GetPan(var lplPan: Longint): HResult; stdcall;
    function GetFrequency(var lpdwFrequency: DWORD): HResult; stdcall;
    function GetStatus(var lpdwStatus: DWORD): HResult; stdcall;
    function Initialize(lpDirectSound: IDirectSound; const
        lpDSBufferDesc: TDSBufferDesc): HResult; stdcall;
    function Lock(dwWriteCursor: DWORD; dwWriteBytes: DWORD;
        var lplpvAudioPtr1: Pointer; var lpdwAudioBytes1: DWORD;
        var lplpvAudioPtr2: Pointer; var lpdwAudioBytes2: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function Play(dwReserved1, dwReserved2: DWORD; dwFlags: DWORD): HResult; stdcall;
    function SetCurrentPosition(dwNewPosition: DWORD): HResult; stdcall;
    function SetFormat(const lpfxFormat: TWaveFormatEx): HResult; stdcall;
    function SetVolume(lVolume: Longint): HResult; stdcall;
    function SetPan(lPan: Longint): HResult; stdcall;
    function SetFrequency(dwFrequency: DWORD): HResult; stdcall;
    function Stop: HResult; stdcall;
    function Unlock(lpvAudioPtr1: Pointer; dwAudioBytes1: DWORD;
        lpvAudioPtr2: Pointer; dwAudioBytes2: DWORD): HResult; stdcall;
    function Restore: HResult; stdcall;
  end;

{ IDirectSound3DListener }

  IDirectSound3DListener = interface(IUnknown)
    ['{279AFA84-4981-11CE-A521-0020AF0BE560}']
    // IDirectSound3DListener methods
    function GetAllParameters(var lpListener: TDS3DListener): HResult; stdcall;
    function GetDistanceFactor(var lpflDistanceFactor: TD3DValue): HResult; stdcall;
    function GetDopplerFactor(var lpflDopplerFactor: TD3DValue): HResult; stdcall;
    function GetOrientation(var lpvOrientFront, lpvOrientTop: TD3DVector): HResult; stdcall;
    function GetPosition(var lpvPosition: TD3DVector): HResult; stdcall;
    function GetRolloffFactor(var lpflRolloffFactor: TD3DValue): HResult; stdcall;
    function GetVelocity(var lpvVelocity: TD3DVector): HResult; stdcall;
    function SetAllParameters(const lpListener: TDS3DListener; dwApply: DWORD): HResult; stdcall;
    function SetDistanceFactor(flDistanceFactor: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetDopplerFactor(flDopplerFactor: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetOrientation(xFront, yFront, zFront, xTop, yTop, zTop: TD3DValue;
        dwApply: DWORD): HResult; stdcall;
    function SetPosition(x, y, z: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetRolloffFactor(flRolloffFactor: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetVelocity(x, y, z: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function CommitDeferredSettings: HResult; stdcall;
  end;

{ IDirectSound3DBuffer }

  IDirectSound3DBuffer = interface(IUnknown)
    ['{279AFA86-4981-11CE-A521-0020AF0BE560}']
    // IDirectSound3DBuffer methods
    function GetAllParameters(var lpDs3dBuffer: TDS3DBuffer): HResult; stdcall;
    function GetConeAngles(var lpdwInsideConeAngle: DWORD;
        var lpdwOutsideConeAngle: DWORD): HResult; stdcall;
    function GetConeOrientation(var lpvOrientation: TD3DVector): HResult; stdcall;
    function GetConeOutsideVolume(var lplConeOutsideVolume: Longint): HResult; stdcall;
    function GetMaxDistance(var lpflMaxDistance: TD3DValue): HResult; stdcall;
    function GetMinDistance(var lpflMinDistance: TD3DValue): HResult; stdcall;
    function GetMode(var lpdwMod: DWORD): HResult; stdcall;
    function GetPosition(var lpvPosition: TD3DVector): HResult; stdcall;
    function GetVelocity(var lpvVelocity: TD3DVector): HResult; stdcall;
    function SetAllParameters(const lpDs3dBuffer: TDS3DBuffer; dwApply: DWORD): HResult; stdcall;
    function SetConeAngles(dwInsideConeAngle: DWORD; dwOutsideConeAngle: DWORD;
        dwApply: DWORD): HResult; stdcall;
    function SetConeOrientation(x, y, z: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetConeOutsideVolume(lConeOutsideVolume: Longint; dwApply: DWORD): HResult; stdcall;
    function SetMaxDistance(flMaxDistance: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetMinDistance(flMinDistance: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetMode(dwMode: DWORD; dwApply: DWORD): HResult; stdcall;
    function SetPosition(x, y, z: TD3DValue; dwApply: DWORD): HResult; stdcall;
    function SetVelocity(x, y, z: TD3DValue; dwApply: DWORD): HResult; stdcall;
  end;

{ IDirectSoundCapture }

  IDirectSoundCapture = interface(IUnknown)
    ['{B0210781-89CD-11D0-AF08-00A0C925CD16}']
    // IDirectSoundCapture methods
    function CreateCaptureBuffer(const lpDSCBufferDesc: TDSCBufferDesc;
        out lplpDirectSoundCaptureBuffer: IDirectSoundCaptureBuffer;
        pUnkOuter: IUnknown): HResult; stdcall;
    function GetCaps(var lpDSCCaps: TDSCCaps): HResult; stdcall;
    function Initialize(lpGuid: PGUID): HResult; stdcall;
  end;

{ IDirectSoundCaptureBuffer }

  IDirectSoundCaptureBuffer = interface(IUnknown)
    ['{B0210782-89CD-11D0-AF08-00A0C925CD16}']
    // IDirectSoundCaptureBuffer methods
    function GetCaps(var lpDSCBCaps: TDSCBCaps): HResult; stdcall;
    function GetCurrentPosition(var lpdwCapturePosition,
        lpdwReadPosition: DWORD): HResult; stdcall;
    function GetFormat(var lpwfxFormat: TWaveFormatEx; dwSizeAllocated: DWORD;
        var lpdwSizeWritten: DWORD): HResult; stdcall;
    function GetStatus(var lpdwStatus: DWORD): HResult; stdcall;
    function Initialize(lpDirectSoundCapture: IDirectSoundCapture;
        const lpcDSBufferDesc: TDSCBufferDesc): HResult; stdcall;
    function Lock(dwReadCursor: DWORD; dwReadBytes: DWORD;
        var lplpvAudioPtr1: Pointer; var lpdwAudioBytes1: DWORD;
        var lplpvAudioPtr2: Pointer; var lpdwAudioBytes2: DWORD;
        dwFlags: DWORD): HResult; stdcall;
    function Start(dwFlags: DWORD): HResult; stdcall;
    function Stop: HResult; stdcall;
    function Unlock(lpvAudioPtr1: Pointer; dwAudioBytes1: DWORD;
        lpvAudioPtr2: Pointer; dwAudioBytes2: DWORD): HResult; stdcall;
  end;

{ IDirectSoundNotify }

  IDirectSoundNotify = interface(IUnknown)
    ['{B0210783-89CD-11D0-AF08-00A0C925CD16}']
    // IDirectSoundNotify methods
    function SetNotificationPositions(cPositionNotifies: DWORD;
        const lpcPositionNotifies): HResult; stdcall;
  end;

{ IKsPropertySet }

const
  KSPROPERTY_SUPPORT_GET = $00000001;
  KSPROPERTY_SUPPORT_SET = $00000002;

  IID_IKsPropertySet: TGUID = (D1:$31efac30;D2:$515c;D3:$11d0;D4:($a9,$aa,$00,$aa,$00,$61,$be,$93));

type
  IKsPropertySet = interface;

  IKsPropertySet = interface(IUnknown)
    ['{31EFAC30-515C-11D0-A9AA-00AA0061BE93}']
    // IKsPropertySet methods
    function GetProperty(const PropertySetId: TGUID; PropertyId: DWORD;
        var pPropertyParams; cbPropertyParams: DWORD;
        var pPropertyData; cbPropertyData: DWORD;
        var pcbReturnedData: ULONG): HResult; stdcall;
    function SetProperty(const PropertySetId: TGUID; PropertyId: DWORD;
        const pPropertyParams; cbPropertyParams: DWORD;
        const pPropertyData; cbPropertyData: DWORD): HResult; stdcall;
    function QuerySupport(const PropertySetId: TGUID; PropertyId: DWORD;
        var pSupport: ULONG): HResult; stdcall;
  end;

{ Return Codes }

const
  DS_OK = 0;
  DSERR_ALLOCATED = $88780000 + 10;
  DSERR_CONTROLUNAVAIL = $88780000 + 30;
  DSERR_INVALIDPARAM = E_INVALIDARG;
  DSERR_INVALIDCALL = $88780000 + 50;
  DSERR_GENERIC = E_FAIL;
  DSERR_PRIOLEVELNEEDED = $88780000 + 70;
  DSERR_OUTOFMEMORY = E_OUTOFMEMORY;
  DSERR_BADFORMAT = $88780000 + 100;
  DSERR_UNSUPPORTED = E_NOTIMPL;
  DSERR_NODRIVER = $88780000 + 120;
  DSERR_ALREADYINITIALIZED = $88780000 + 130;
  DSERR_NOAGGREGATION = CLASS_E_NOAGGREGATION;
  DSERR_BUFFERLOST = $88780000 + 150;
  DSERR_OTHERAPPHASPRIO = $88780000 + 160;
  DSERR_UNINITIALIZED = $88780000 + 170;
  DSERR_NOINTERFACE = E_NOINTERFACE;

{ Flags }

  DSCAPS_PRIMARYMONO      = $00000001;
  DSCAPS_PRIMARYSTEREO    = $00000002;
  DSCAPS_PRIMARY8BIT      = $00000004;
  DSCAPS_PRIMARY16BIT     = $00000008;
  DSCAPS_CONTINUOUSRATE   = $00000010;
  DSCAPS_EMULDRIVER       = $00000020;
  DSCAPS_CERTIFIED        = $00000040;
  DSCAPS_SECONDARYMONO    = $00000100;
  DSCAPS_SECONDARYSTEREO  = $00000200;
  DSCAPS_SECONDARY8BIT    = $00000400;
  DSCAPS_SECONDARY16BIT   = $00000800;

  DSBPLAY_LOOPING         = $00000001;

  DSBSTATUS_PLAYING       = $00000001;
  DSBSTATUS_BUFFERLOST    = $00000002;
  DSBSTATUS_LOOPING       = $00000004;

  DSBLOCK_FROMWRITECURSOR = $00000001;
  DSBLOCK_ENTIREBUFFER    = $00000002;

  DSSCL_NORMAL            = $00000001;
  DSSCL_PRIORITY          = $00000002;
  DSSCL_EXCLUSIVE         = $00000003;
  DSSCL_WRITEPRIMARY      = $00000004;

  DS3DMODE_NORMAL         = $00000000;
  DS3DMODE_HEADRELATIVE   = $00000001;
  DS3DMODE_DISABLE        = $00000002;

  DS3D_IMMEDIATE          = $00000000;
  DS3D_DEFERRED           = $00000001;

  DS3D_MINDISTANCEFACTOR     = 0.0;
  DS3D_MAXDISTANCEFACTOR     = 10.0;
  DS3D_DEFAULTDISTANCEFACTOR = 1.0;

  DS3D_MINROLLOFFFACTOR      = 0.0;
  DS3D_MAXROLLOFFFACTOR      = 10.0;
  DS3D_DEFAULTROLLOFFFACTOR  = 1.0;

  DS3D_MINDOPPLERFACTOR      = 0.0;
  DS3D_MAXDOPPLERFACTOR      = 10.0;
  DS3D_DEFAULTDOPPLERFACTOR  = 1.0;

  DS3D_DEFAULTMINDISTANCE    = 1.0;
  DS3D_DEFAULTMAXDISTANCE    = 1000000000.0;

  DS3D_MINCONEANGLE          = 0;
  DS3D_MAXCONEANGLE          = 360;
  DS3D_DEFAULTCONEANGLE      = 360;

  DS3D_DEFAULTCONEOUTSIDEVOLUME = 0;

  DSBCAPS_PRIMARYBUFFER       = $00000001;
  DSBCAPS_STATIC              = $00000002;
  DSBCAPS_LOCHARDWARE         = $00000004;
  DSBCAPS_LOCSOFTWARE         = $00000008;
  DSBCAPS_CTRL3D              = $00000010;
  DSBCAPS_CTRLFREQUENCY       = $00000020;
  DSBCAPS_CTRLPAN             = $00000040;
  DSBCAPS_CTRLVOLUME          = $00000080;
  DSBCAPS_CTRLPOSITIONNOTIFY  = $00000100;
  DSBCAPS_CTRLDEFAULT         = $000000E0;
  DSBCAPS_CTRLALL             = $000001F0;
  DSBCAPS_STICKYFOCUS         = $00004000;
  DSBCAPS_GLOBALFOCUS         = $00008000;
  DSBCAPS_GETCURRENTPOSITION2 = $00010000;
  DSBCAPS_MUTE3DATMAXDISTANCE = $00020000;

  DSCBCAPS_WAVEMAPPED = $80000000;

  DSSPEAKER_HEADPHONE = $00000001;
  DSSPEAKER_MONO      = $00000002;
  DSSPEAKER_QUAD      = $00000003;
  DSSPEAKER_STEREO    = $00000004;
  DSSPEAKER_SURROUND  = $00000005;

function DSSPEAKER_COMBINED(c, g: Byte): DWORD;
function DSSPEAKER_CONFIG(a: DWORD): Byte;
function DSSPEAKER_GEOMETRY(a: DWORD): Byte;

const
  DSCCAPS_EMULDRIVER    = $00000020;

  DSCBLOCK_ENTIREBUFFER = $00000001;

  DSCBSTATUS_CAPTURING  = $00000001;
  DSCBSTATUS_LOOPING    = $00000002;

  DSCBSTART_LOOPING     = $00000001;

  DSBFREQUENCY_MIN      = 100;
  DSBFREQUENCY_MAX      = 100000;
  DSBFREQUENCY_ORIGINAL = 0;

  DSBPAN_LEFT   = -10000;
  DSBPAN_CENTER = 0;
  DSBPAN_RIGHT  = 10000;

  DSBVOLUME_MIN = -10000;
  DSBVOLUME_MAX = 0;

  DSBSIZE_MIN = 4;
  DSBSIZE_MAX = $0FFFFFFF;

  DSBPN_OFFSETSTOP = $FFFFFFFF;

{ DirectSound API }

type
  TDSEnumCallbackW = function(lpGuid: PGUID; lpstrDescription: LPCWSTR;
    lpstrModule: LPCWSTR; lpContext: Pointer): BOOL; stdcall;
  LPDSENUMCALLBACKW = TDSEnumCallbackW;

  TDSEnumCallbackA = function(lpGuid: PGUID; lpstrDescription: LPCSTR;
    lpstrModule: LPCSTR; lpContext: Pointer): BOOL; stdcall;
  LPDSENUMCALLBACKA = TDSEnumCallbackA;

  TDSEnumCallback = TDSEnumCallbackA;
  LPDSENUMCALLBACK = TDSEnumCallback;

function DirectSoundCreate(lpGUID: PGUID; out lpDS: IDirectSound; pUnkOuter: IUnknown): HResult; stdcall;
function DirectSoundEnumerateA(lpDSEnumCallback: TDSEnumCallbackA; lpContext: Pointer): HResult; stdcall;
function DirectSoundEnumerateW(lpDSEnumCallback: TDSEnumCallbackW; lpContext: Pointer): HResult; stdcall;
function DirectSoundEnumerate(lpDSEnumCallback: TDSEnumCallbackA; lpContext: Pointer): HResult; stdcall;

function DirectSoundCaptureCreate(lpGUID: PGUID; out lplpDSC: IDirectSoundCapture; pUnkOuter: IUnknown): HResult; stdcall;
function DirectSoundCaptureEnumerateA(lpDSEnumCallback: TDSEnumCallbackA; lpContext: Pointer): HResult; stdcall;
function DirectSoundCaptureEnumerateW(lpDSEnumCallback: TDSEnumCallbackW; lpContext: Pointer): HResult; stdcall;
function DirectSoundCaptureEnumerate(lpDSEnumCallback: TDSEnumCallbackA; lpContext: Pointer): HResult; stdcall;

implementation

const
  DDrawLib = 'DDraw.dll';
  D3DRMLib = 'D3DRM.dll';
  DInputLib = 'DInput.dll';
  DPlayXLib = 'DPlayX.dll';
  DSetupLib = 'DSetup.dll';
  DSoundLib = 'DSound.dll';

{ DirectDraw }

function DirectDrawEnumerateA; external DDrawLib;
function DirectDrawEnumerateW; external DDrawLib;
function DirectDrawEnumerate; external DDrawLib name 'DirectDrawEnumerateA';

function DirectDrawEnumerateExA; external DDrawLib;
function DirectDrawEnumerateExW; external DDrawLib;
function DirectDrawEnumerateEx; external DDrawLib name 'DirectDrawEnumerateExA';

function DirectDrawCreate; external DDrawLib;
function DirectDrawCreateClipper; external DDrawLib;

{ Direct3D }

function D3DVALP(val: TD3DValue; prec: Integer): TD3DValue;
begin
  Result := val;
end;

function D3DVAL(val: TD3DValue): TD3DValue;
begin
  Result := val;
end;

function D3DDivide(a, b: TD3DValue): TD3DValue;
begin
  Result := a / b;
end;

function D3DMultiply(a, b: TD3DValue): TD3DValue;
begin
  Result := a * b;
end;

function D3DTRIFLAG_STARTFLAT(len: DWORD) : DWORD;
begin
  if not (len in [1..29]) then len := 0;
  result := len;
end;

function CI_GETALPHA(ci: Integer): Byte;
begin
  Result := ci shr 24;
end;

function CI_GETINDEX(ci: Integer): Word;
begin
  Result := ci shr 8;
end;

function CI_GETFRACTION(ci: Integer): Byte;
begin
  Result := ci;
end;

function CI_ROUNDINDEX(ci: Integer): Integer;
begin
  Result := CI_GETINDEX(ci)+$80;
end;

function CI_MASKALPHA(ci: Integer): Integer;
begin
  Result := ci and $FFFFFF;
end;

function CI_MAKE(a: Byte; i: Word; f: Byte): Integer;
begin
  Result := (a shl 24) or (i shl 8) or f;
end;

function RGBA_GETALPHA(rgb: TD3DColor): Byte;
begin
  Result := rgb shr 24;
end;

function RGBA_GETRED(rgb: TD3DColor): Byte;
begin
  Result := rgb shr 16;
end;

function RGBA_GETGREEN(rgb: TD3DColor): Byte;
begin
  Result := rgb shr 8;
end;

function RGBA_GETBLUE(rgb: TD3DColor): Byte;
begin
  Result := rgb;
end;

function RGBA_MAKE(r, g, b, a: Byte): TD3DColor;
begin
  Result := (a shl 24) or (r shl 16) or (g shl 8) or b;
end;

function D3DRGB(r, g, b: TD3DValue): TD3DColor;
begin
  Result := $FF000000 or (Trunc(r*255) shl 16) or (Trunc(g*255) shl 8) or
       (Trunc(b*255));
end;

function D3DRGBA(r, g, b, a: TD3DValue): TD3DColor;
begin
  Result := (Trunc(a*255) shl 24) or (Trunc(r*255) shl 16) or (Trunc(g*255) shl 8) or
    (Trunc(b*255));
end;

function RGB_GETRED(rgb: TD3DColor): Byte;
begin
  Result := rgb shr 16;
end;

function RGB_GETGREEN(rgb: TD3DColor): Byte;
begin
  Result := rgb shr 8;
end;

function RGB_GETBLUE(rgb: TD3DColor): Byte;
begin
  Result := rgb;
end;

function RGBA_SETALPHA(rgba: TD3DColor; x: Byte): TD3DColor;
begin
  Result := (x shl 24) or (rgba and $00FFFFFF);
end;

function RGB_MAKE(r, g, b: Byte): TD3DColor;
begin
  Result := (r shl 16) or (g shl 8) or b;
end;

function RGBA_TORGB(rgba: TD3DColor): TD3DColor;
begin
  Result := rgba and $00FFFFFF;
end;

function RGB_TORGBA(rgb: TD3DColor): TD3DColor;
begin
  Result := rgb or $FF000000;
end;

function VectorAdd(v1, v2: TD3DVector) : TD3DVector;
begin
  result.x := v1.x+v2.x;
  result.y := v1.y+v2.y;
  result.z := v1.z+v2.z;
end;

function VectorSub(v1, v2: TD3DVector) : TD3DVector;
begin
  result.x := v1.x-v2.x;
  result.y := v1.y-v2.y;
  result.z := v1.z-v2.z;
end;

function VectorMulS(v: TD3DVector; s: TD3DValue) : TD3DVector;
begin
  result.x := v.x*s;
  result.y := v.y*s;
  result.z := v.z*s;
end;

function VectorDivS(v: TD3DVector; s: TD3DValue) : TD3DVector;
begin
  result.x := v.x/s;
  result.y := v.y/s;
  result.z := v.z/s;
end;

function VectorMul(v1, v2: TD3DVector) : TD3DVector;
begin
  result.x := v1.x*v2.x;
  result.y := v1.y*v2.y;
  result.z := v1.z*v2.z;
end;

function VectorDiv(v1, v2: TD3DVector) : TD3DVector;
begin
  result.x := v1.x/v2.x;
  result.y := v1.y/v2.y;
  result.z := v1.z/v2.z;
end;

function VectorSmaller(v1, v2: TD3DVector) : boolean;
begin
  result := (v1.x < v2.x) and (v1.y < v2.y) and (v1.z < v2.z);
end;

function VectorSmallerEquel(v1, v2: TD3DVector) : boolean;
begin
  result := (v1.x <= v2.x) and (v1.y <= v2.y) and (v1.z <= v2.z);
end;

function VectorEquel(v1, v2: TD3DVector) : boolean;
begin
  result := (v1.x = v2.x) and (v1.y = v2.y) and (v1.z = v2.z);
end;

function VectorSquareMagnitude(v: TD3DVector) : TD3DValue;
begin
  result := (v.x*v.x) + (v.y*v.y) + (v.z*v.z);
end;

function VectorMagnitude(v: TD3DVector) : TD3DValue;
begin
  result := sqrt( (v.x*v.x) + (v.y*v.y) + (v.z*v.z) );
end;

function VectorNormalize(v: TD3DVector) : TD3DVector;
begin
  result := VectorDivS(v,VectorMagnitude(v));
end;

function VectorMin(v: TD3DVector) : TD3DValue;
var
  ret : TD3DValue;
begin
  ret := v.x;
  if (v.y < ret) then ret := v.y;
  if (v.z < ret) then ret := v.z;
  result := ret;
end;

function VectorMax(v: TD3DVector) : TD3DValue;
var
  ret : TD3DValue;
begin
  ret := v.x;
  if (ret < v.y) then ret := v.y;
  if (ret < v.z) then ret := v.z;
  result := ret;
end;

function VectorMinimize(v1, v2: TD3DVector) : TD3DVector;
begin
  if v1.x < v2.x then result.x := v1.x else result.x := v2.x;
  if v1.y < v2.y then result.y := v1.y else result.y := v2.y;
  if v1.z < v2.z then result.z := v1.z else result.z := v2.z;
end;

function VectorMaximize(v1, v2: TD3DVector) : TD3DVector;
begin
  if v1.x > v2.x then result.x := v1.x else result.x := v2.x;
  if v1.y > v2.y then result.y := v1.y else result.y := v2.y;
  if v1.z > v2.z then result.z := v1.z else result.z := v2.z;
end;

function VectorDotProduct(v1, v2: TD3DVector) : TD3DValue;
begin
  result := (v1.x*v2.x) + (v1.y * v2.y) + (v1.z*v2.z);
end;

function VectorCrossProduct(v1, v2: TD3DVector) : TD3DVector;
begin
  result.x := (v1.y*v2.z) - (v1.z*v2.y);
  result.y := (v1.z*v2.x) - (v1.x*v2.z);
  result.z := (v1.x*v2.y) - (v1.y*v2.x);
end;

{ Direct3DRM }

procedure D3DRMAnimationGetRotateKey(const rmKey: TD3DRMAnimationKey; var rmQuat: TD3DRMQuaternion);
begin
  rmQuat.s := rmKey.dvK[0];
  rmQuat.v.x := rmKey.dvK[1];
  rmQuat.v.y := rmKey.dvK[2];
  rmQuat.v.z := rmKey.dvK[3];
end;

procedure D3DRMAnimationGetScaleKey(const rmKey: TD3DRMAnimationKey; var dvVec: TD3DVector);
begin
  dvVec.x := rmKey.dvK[0];
  dvVec.y := rmKey.dvK[1];
  dvVec.z := rmKey.dvK[2];
end;

procedure D3DRMAnimationGetPositionKey(const rmKey: TD3DRMAnimationKey; var dvVec: TD3DVector);
begin
  dvVec.x := rmKey.dvK[0];
  dvVec.y := rmKey.dvK[1];
  dvVec.z := rmKey.dvK[2];
end;

procedure D3DRMAnimationSetRotateKey(var rmKey: TD3DRMAnimationKey; const rmQuat: TD3DRMQuaternion);
begin
  rmKey.dvK[0] := rmQuat.s;
  rmKey.dvK[1] := rmQuat.v.x;
  rmKey.dvK[2] := rmQuat.v.y;
  rmKey.dvK[3] := rmQuat.v.z;
end;

procedure D3DRMAnimationSetScaleKey(var rmKey: TD3DRMAnimationKey; const dvVec: TD3DVector);
begin
  rmKey.dvK[0] := dvVec.x;
  rmKey.dvK[1] := dvVec.y;
  rmKey.dvK[2] := dvVec.z;
end;

procedure D3DRMAnimationSetPositionKey(var rmKey: TD3DRMAnimationKey; const dvVec: TD3DVector);
begin
  rmKey.dvK[0] := dvVec.x;
  rmKey.dvK[1] := dvVec.y;
  rmKey.dvK[2] := dvVec.z;
end;

function Direct3DRMCreate; external D3DRMLib;

function D3DRMCreateColorRGB; external D3DRMLib;
function D3DRMCreateColorRGBA; external D3DRMLib;
function D3DRMColorGetRed; external D3DRMLib;
function D3DRMColorGetGreen; external D3DRMLib;
function D3DRMColorGetBlue; external D3DRMLib;
function D3DRMColorGetAlpha; external D3DRMLib;
function D3DRMVectorAdd; external D3DRMLib;
function D3DRMVectorSubtract; external D3DRMLib;
function D3DRMVectorReflect; external D3DRMLib;
function D3DRMVectorCrossProduct; external D3DRMLib;
function D3DRMVectorDotProduct; external D3DRMLib;
function D3DRMVectorNormalize; external D3DRMLib;
function D3DRMVectorModulus; external D3DRMLib;
function D3DRMVectorRotate; external D3DRMLib;
function D3DRMVectorScale; external D3DRMLib;
function D3DRMVectorRandom; external D3DRMLib;
function D3DRMQuaternionFromRotation; external D3DRMLib;
function D3DRMQuaternionMultiply; external D3DRMLib;
function D3DRMQuaternionSlerp; external D3DRMLib;
procedure D3DRMMatrixFromQuaternion; external D3DRMLib;
function D3DRMQuaternionFromMatrix; external D3DRMLib;

function DirectXFileCreate; external D3DRMLib;

{ DirectInput }

function GET_DIDEVICE_TYPE(dwDevType: DWORD): DWORD;
begin
  Result := LOBYTE(dwDevType);
end;

function GET_DIDEVICE_SUBTYPE(dwDevType: DWORD): DWORD;
begin
  Result := HIBYTE(dwDevType);
end;

function DIEFT_GETTYPE(n: DWORD): DWORD;
begin
  Result := LOBYTE(n);
end;

function DIDFT_MAKEINSTANCE(n: WORD): DWORD;
begin
  Result := n shl 8;
end;

function DIDFT_GETTYPE(n: DWORD): DWORD;
begin
  Result := LOBYTE(n);
end;

function DIDFT_GETINSTANCE(n: DWORD): WORD;
begin
  Result := n shr 8;
end;

function DIDFT_ENUMCOLLECTION(n: WORD): DWORD;
begin
  Result := n shl 8;
end;

function DirectInputCreate; external DInputLib name 'DirectInputCreateA';

{ DirectPlay }

function DirectPlayEnumerateA; external DPlayXLib;
function DirectPlayEnumerateW; external DPlayXLib;
function DirectPlayEnumerate; external DPlayXLib name 'DirectPlayEnumerateA';

function DirectPlayCreate; external DPlayXLib;

function DirectPlayLobbyCreateW; external DPlayXLib;
function DirectPlayLobbyCreateA; external DPlayXLib;
function DirectPlayLobbyCreate; external DPlayXLib name 'DirectPlayLobbyCreateA';

{ DirectSetup }

function DirectXSetupA; external DSetupLib;
function DirectXSetupW; external DSetupLib;
function DirectXSetup; external DSetupLib name 'DirectXSetupA';

function DirectXDeviceDriverSetupA; external DSetupLib;
function DirectXDeviceDriverSetupW; external DSetupLib;
function DirectXDeviceDriverSetup; external DSetupLib name 'DirectXDeviceDriverSetupA';

function DirectXRegisterApplicationA; external DSetupLib;
function DirectXRegisterApplicationW; external DSetupLib;
function DirectXRegisterApplication; external DSetupLib name 'DirectXRegisterApplicationA';

function DirectXUnRegisterApplication; external DSetupLib;

function DirectXSetupSetCallback; external DSetupLib;

function DirectXSetupGetVersion; external DSetupLib;

{ DirectSound }

function DSSPEAKER_COMBINED(c, g: Byte): DWORD;
begin
  Result := c or (g shl 16);
end;

function DSSPEAKER_CONFIG(a: DWORD): Byte;
begin
  Result := a;
end;

function DSSPEAKER_GEOMETRY(a: DWORD): Byte;
begin
  Result := a shr 16;
end;

function DirectSoundCreate; external DSoundLib;
function DirectSoundEnumerateA; external DSoundLib;
function DirectSoundEnumerateW; external DSoundLib;
function DirectSoundEnumerate; external DSoundLib name 'DirectSoundEnumerateA';

function DirectSoundCaptureCreate; external DSoundLib;
function DirectSoundCaptureEnumerateA; external DSoundLib;
function DirectSoundCaptureEnumerateW; external DSoundLib;
function DirectSoundCaptureEnumerate; external DSoundLib name 'DirectSoundCaptureEnumerateA';

end.

