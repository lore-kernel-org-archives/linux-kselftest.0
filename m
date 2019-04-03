From: shuah@kernel.org (shuah)
Date: Tue, 2 Apr 2019 18:29:39 -0600
Subject: [PATCH v3 0/7] lib/string: Add strscpy_pad() function
In-Reply-To: <20190403002527.GB29296@eros.localdomain>
References: <20190306214226.14598-1-tobin@kernel.org>
 <CAGXu5jJeFOBBiofjG6_rqbf+_0fbKC46pzyfoACWt+NBg-bXtg@mail.gmail.com>
 <20190403002527.GB29296@eros.localdomain>
Message-ID: <5c780987-e8d4-a1cf-2ea6-a16087e4491d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190403002939.YLJAE_0hST5t3AzHNEMCFkRdcZipPRQwH7KX8G57f9c@z>

On 4/2/19 6:25 PM, Tobin C. Harding wrote:
> On Tue, Apr 02, 2019@02:37:57PM -0700, Kees Cook wrote:
>> On Wed, Mar 6, 2019@1:43 PM Tobin C. Harding <tobin@kernel.org> wrote:
>>> This set makes an attempt at adding a framework to kselftest for writing
>>> kernel test modules.  It also adds a script for use in creating script
>>> test runners for kselftest.  My macro-foo is not great, all criticism
>>> and suggestions very much appreciated.  The design is based on test
>>> modules lib/test_printf.c, lib/test_bitmap.c, lib/test_xarray.c.
>>
>> Hi Shuah,
>>
>> The bulk of this series is in the kselftests. Would you be willing to
>> carry this series?
>>
>> I think it might be able to use a v4 just to clean up the
>> script-finding logic, but I might be entirely missing something about
>> the best way to do it.
> 
> v4 to come once I grok the bash stuff you suggested in 'PATCH v3.1'.
> 

Yes I can take care of these. Will wait for v4

thanks,
-- Shuah
