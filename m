From: shuah@kernel.org (shuah)
Date: Fri, 8 Feb 2019 10:53:22 -0700
Subject: [PATCH 1/2] selftests: firmware: remove use of non-standard diff
 -Z option
In-Reply-To: <CAB=NE6Wtfe_TafSTU+=0S-n9_vQXaT3FKOrcDrzHBNzj3bY47w@mail.gmail.com>
References: <20181127031218.24419-1-dan.rue@linaro.org>
 <20181127031218.24419-2-dan.rue@linaro.org>
 <20181130023732.GO4922@garbanzo.do-not-panic.com>
 <20181205204341.7fd4ob5c6pwx375m@xps.therub.org>
 <CAB=NE6Wtfe_TafSTU+=0S-n9_vQXaT3FKOrcDrzHBNzj3bY47w@mail.gmail.com>
Message-ID: <b44fc032-f2dc-dfa4-bc22-7b7689a9b836@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190208175322.Rz3h1EqXJc5y-IzzbeZJzalRgOBiq-KSeGaJK7awW5Y@z>

On 2/7/19 11:20 AM, Luis Chamberlain wrote:
> On Wed, Dec 5, 2018@2:43 PM Dan Rue <dan.rue@linaro.org> wrote:
>>
>> On Thu, Nov 29, 2018@06:37:32PM -0800, Luis Chamberlain wrote:
>>> On Mon, Nov 26, 2018@09:12:15PM -0600, Dan Rue wrote:
>>>> diff -Z is used to trim the trailing whitespace when comparing the
>>>> loaded firmware file with the source firmware file. However, per the
>>>> comment in the source code, -Z should not be necessary. In testing, the
>>>> input and output files are identical.
>>>>
>>>> Additionally, -Z is not a standard option and is not available in
>>>> environments such as busybox. When -Z is not supported, diff fails with
>>>> a usage error, which is suppressed, but then causes read_firmwares() to
>>>> exit with a false failure message.
>>>
>>> NACK -- this breaks testing on debian:
>>>
>>> Testing with the file present...
>>> Batched request_firmware() try #1: Files
>>> /tmp/tmp.8GWkoSo5jZ/test-firmware.bin and
>>> /sys/devices/virtual/misc/test_firmware/read_firmware differ
>>> request #0: firmware was not loaded
>>>
>>> Please add a quirks check, enable it by default, and remove it for
>>> Busybox.
>>
>> Thanks for the review. Shuah, can you please drop this one?
> 
> So much for review. This patch was still merged. I'll have to request
> this to be reverted now too.
> 
>    Luis
> 

Sorry about this. I will pull the reverts in.

thanks,
-- Shuah
