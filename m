From: rdunlap at infradead.org (Randy Dunlap)
Date: Tue, 2 Apr 2019 14:33:12 -0700
Subject: [PATCH v3 2/7] kselftest: Add test runner creation script
In-Reply-To: <CAGXu5j+=O3C6z7H5j93Z4mQkpS3f0ea_7T+LRQEnRCZCoKX8zw@mail.gmail.com>
References: <20190306214226.14598-1-tobin@kernel.org>
 <20190306214226.14598-3-tobin@kernel.org>
 <CAGXu5j+=O3C6z7H5j93Z4mQkpS3f0ea_7T+LRQEnRCZCoKX8zw@mail.gmail.com>
Message-ID: <32a2dca5-d3cd-e7d3-e73b-406d897ae174@infradead.org>

Hi,

nits/typos below:

On 4/2/19 2:27 PM, Kees Cook wrote:
> On Wed, Mar 6, 2019 at 1:43 PM Tobin C. Harding <tobin at kernel.org> wrote:
>>
>>
>> Add test runner creation script.
>>
>> Signed-off-by: Tobin C. Harding <tobin at kernel.org>
>> ---
>>  tools/testing/selftests/kselftest_module.sh | 75 +++++++++++++++++++++
>>  1 file changed, 75 insertions(+)
>>  create mode 100755 tools/testing/selftests/kselftest_module.sh
>>
>> diff --git a/tools/testing/selftests/kselftest_module.sh b/tools/testing/selftests/kselftest_module.sh
>> new file mode 100755
>> index 000000000000..b5d446738614
>> --- /dev/null
>> +++ b/tools/testing/selftests/kselftest_module.sh
>> @@ -0,0 +1,75 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +#
>> +# Runs an individual test module.  kselftest expects a separate
>> +# executable for each test.  So test should each have an individial

                                                             individual

>> +# script that can call this script.
>> +#
>> +
>> +# Individual test scrits should define these:

                      scripts

>> +module=""                      # filename (without the .ko).
>> +desc=""                                # Output prefix.


cheers.
-- 
~Randy
