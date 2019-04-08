From: shuah@kernel.org (shuah)
Date: Mon, 8 Apr 2019 08:08:45 -0600
Subject: [PATCH v4 0/6] lib/string: Add strscpy_pad() function
In-Reply-To: <20190405015859.32755-1-tobin@kernel.org>
References: <20190405015859.32755-1-tobin@kernel.org>
Message-ID: <3d1bc44f-313b-5a58-3492-b706d9510d34@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408140845.Z3dTLjfqvPpbSYjL6LbXbArvEiWG8jiVr0PzVEtOxjw@z>

On 4/4/19 7:58 PM, Tobin C. Harding wrote:
> Hi Shua,
> 
> Here is the set with cleanup as suggested by Kees on v3.
> 
> Configured, built, and tested all modules loaded by
> tools/testing/selftests/lib/*.sh
> 
>>From previous cover letters ...
> 
> While doing the testing for strscpy_pad() it was noticed that there is
> duplication in how test modules are being fed to kselftest and also in
> the test modules themselves.
> 
> This set makes an attempt at adding a framework to kselftest for writing
> kernel test modules.  It also adds a script for use in creating script
> test runners for kselftest.  My macro-foo is not great, all criticism
> and suggestions very much appreciated.  The design is based on test
> modules lib/test_printf.c, lib/test_bitmap.c, lib/test_xarray.c.
> 
> Changes since last version:
> 
>   - Remove dependency on Bash (thanks Kees)
>   - Use oneliner to implement kselftest test runners (thanks Kees)
>   - Squash patch that adds kselftest script creator script with patch
>     that uses it.
>   - Fix typos (thanks Randy)
>   - Add Kees' Acked-by tags to all patches
> 
> thanks,
> Tobin.
> 
> 

Hi Tobin,

Thanks for this restructuring work and adding the framework. Thanks Kees
for the reviews.

The patch is series in now in linux-kselftest next for 5.2

thanks,
-- Shuah
