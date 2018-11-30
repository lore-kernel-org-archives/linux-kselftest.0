From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 18:37:32 -0800
Subject: [PATCH 1/2] selftests: firmware: remove use of non-standard diff
 -Z option
In-Reply-To: <20181127031218.24419-2-dan.rue@linaro.org>
References: <20181127031218.24419-1-dan.rue@linaro.org>
 <20181127031218.24419-2-dan.rue@linaro.org>
Message-ID: <20181130023732.GO4922@garbanzo.do-not-panic.com>

On Mon, Nov 26, 2018 at 09:12:15PM -0600, Dan Rue wrote:
> diff -Z is used to trim the trailing whitespace when comparing the
> loaded firmware file with the source firmware file. However, per the
> comment in the source code, -Z should not be necessary. In testing, the
> input and output files are identical.
> 
> Additionally, -Z is not a standard option and is not available in
> environments such as busybox. When -Z is not supported, diff fails with
> a usage error, which is suppressed, but then causes read_firmwares() to
> exit with a false failure message.

NACK -- this breaks testing on debian:

Testing with the file present...
Batched request_firmware() try #1: Files
/tmp/tmp.8GWkoSo5jZ/test-firmware.bin and
/sys/devices/virtual/misc/test_firmware/read_firmware differ
request #0: firmware was not loaded

Please add a quirks check, enable it by default, and remove it for
Busybox.

   Luis
