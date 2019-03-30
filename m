From: shuah@kernel.org (Shuah Khan)
Date: Fri, 29 Mar 2019 19:54:01 -0600
Subject: [PATCH v14 6/6] selftests: media_dev_allocator api test
In-Reply-To: <cover.1553909892.git.shuah@kernel.org>
References: <cover.1553909892.git.shuah@kernel.org>
Message-ID:
 <58769883bfbb8b959b12952d155de87fc01f6d99.1553909893.git.shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190330015401.q1Sjw_8FxDhptd1rW8uGc7CzneT4uv4mrLq49cnMvpg@z>

Add a new test for Media Device Allocator API.

Media Device Allocator API to allows multiple drivers share a media device.
This API solves a very common use-case for media devices where one physical
device (an USB stick) provides both audio and video. When such media device
exposes a standard USB Audio class, a proprietary Video class, two or more
independent drivers will share a single physical USB bridge. In such cases,
it is necessary to coordinate access to the shared resource.

Using this API, drivers can allocate a media device with the shared struct
device as the key. Once the media device is allocated by a driver, other
drivers can get a reference to it. The media device is released when all
the references are released.

This test does a series of unbind/bind tests to make sure media device
is released correctly when it is no longer is use and when the last
driver releases the reference.

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 .../media_tests/media_dev_allocator.sh        | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100755 tools/testing/selftests/media_tests/media_dev_allocator.sh

diff --git a/tools/testing/selftests/media_tests/media_dev_allocator.sh b/tools/testing/selftests/media_tests/media_dev_allocator.sh
new file mode 100755
index 000000000000..ffe00c59a483
--- /dev/null
+++ b/tools/testing/selftests/media_tests/media_dev_allocator.sh
@@ -0,0 +1,85 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Media Device Allocator API test script
+# Copyright (c) 2019 Shuah Khan <shuah at kernel.org>
+
+echo "Media Device Allocator testing: unbind and bind"
+echo "media driver $1 audio driver $2"
+
+MDRIVER=/sys/bus/usb/drivers/$1
+cd $MDRIVER
+MDEV=$(ls -d *\-*)
+
+ADRIVER=/sys/bus/usb/drivers/$2
+cd $ADRIVER
+ADEV=$(ls -d *\-*.1)
+
+echo "=================================="
+echo "Test unbind both devices - start"
+echo "Running unbind of $MDEV from $MDRIVER"
+echo $MDEV > $MDRIVER/unbind;
+
+echo "Media device should still be present!"
+ls -l /dev/media*
+
+echo "sound driver is at: $ADRIVER"
+echo "Device is: $ADEV"
+
+echo "Running unbind of $ADEV from $ADRIVER"
+echo $ADEV > $ADRIVER/unbind;
+
+echo "Media device should have been deleted!"
+ls -l /dev/media*
+echo "Test unbind both devices - end"
+
+echo "=================================="
+
+echo "Test bind both devices - start"
+echo "Running bind of $MDEV from $MDRIVER"
+echo $MDEV > $MDRIVER/bind;
+
+echo "Media device should be present!"
+ls -l /dev/media*
+
+echo "Running bind of $ADEV from $ADRIVER"
+echo $ADEV > $ADRIVER/bind;
+
+echo "Media device should be there!"
+ls -l /dev/media*
+
+echo "Test bind both devices - end"
+
+echo "=================================="
+
+echo "Test unbind $MDEV - bind $MDEV - unbind $ADEV - bind $ADEV start"
+
+echo "Running unbind of $MDEV from $MDRIVER"
+echo $MDEV > $MDRIVER/unbind;
+
+echo "Media device should be there!"
+ls -l /dev/media*
+
+sleep 1
+
+echo "Running bind of $MDEV from $MDRIVER"
+echo $MDEV > $MDRIVER/bind;
+
+echo "Media device should be there!"
+ls -l /dev/media*
+
+echo "Running unbind of $ADEV from $ADRIVER"
+echo $ADEV > $ADRIVER/unbind;
+
+echo "Media device should be there!"
+ls -l /dev/media*
+
+sleep 1
+
+echo "Running bind of $ADEV from $ADRIVER"
+echo $ADEV > $ADRIVER/bind;
+
+echo "Media device should be there!"
+ls -l /dev/media*
+
+echo "Test unbind $MDEV - bind $MDEV - unbind $ADEV - bind $ADEV end"
+echo "=================================="
-- 
2.17.1
