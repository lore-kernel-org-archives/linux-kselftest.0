From: shuah at kernel.org (shuah)
Date: Tue, 16 Apr 2019 09:50:16 -0600
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
In-Reply-To: <20190416092610.78b462de@lwn.net>
References: <20190416142651.7048-1-shuah@kernel.org>
 <20190416092610.78b462de@lwn.net>
Message-ID: <90615fb4-ff56-af72-f4ea-f3dbc3db26df@kernel.org>

On 4/16/19 9:26 AM, Jonathan Corbet wrote:
> On Tue, 16 Apr 2019 08:26:51 -0600
> Shuah Khan <shuah at kernel.org> wrote:
> 
>> Fix KBUILD_OUTPUT usage instructions. The current documentation
>> is incorrect.
>>
>> Signed-off-by: Shuah Khan <shuah at kernel.org>
> 
> So I'll confess to being a little confused by this one...

I generated the patch on a system with older .gitconfig. :)


> 
>>   Documentation/dev-tools/kselftest.rst | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>> index c8c03388b9de..6c910ddaa9f9 100644
>> --- a/Documentation/dev-tools/kselftest.rst
>> +++ b/Documentation/dev-tools/kselftest.rst
>> @@ -39,9 +39,9 @@ Build and run from user specific object directory (make O=dir)::
>>   
>>     $ make O=/tmp/kselftest kselftest
>>   
>> -Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
>> +Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
>>   
>> -  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
>> +  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
> 
> Is there a particular reason why this variable needs to be set in the
> environment rather than just in make?  More importantly, though, I don't
> think this would work if you run it from the KBUILD_OUTPUT directory.  What
> you're really doing is running with a separate output directory, right?
> 

That is correct. I am matching the instructions in the main Makefile:

# kbuild supports saving output files in a separate directory.
# To locate output files in a separate directory two syntaxes are supported.
# In both cases the working directory must be the root of the kernel src.
# 1) O=
# Use "make O=dir/to/store/output/files/"
#

# 2) Set KBUILD_OUTPUT
# Set the environment variable KBUILD_OUTPUT to point to the directory
# where the output files shall be placed.
# export KBUILD_OUTPUT=dir/to/store/output/files/
# make

kselftest documentation doesn't match the main Makefile. I am fixing
that with this patch.

For both cases the working directory is the src dir just like the main
Makefile.

I hope this helps.

thanks,
-- Shuah
