From: shuah at kernel.org (shuah)
Date: Tue, 9 Apr 2019 11:04:21 -0600
Subject: [PATCH] selftests/lib.mk: Move test output to diagnostic lines
In-Reply-To: <CAGXu5jLta_gWu+5SXMrkQY3pTVnZ43CAK24Z5xAXdzJMwYWojQ@mail.gmail.com>
References: <20190408203012.GA566@beast>
 <ac089bd1-0abb-da5b-a418-b81ea9957a28@kernel.org>
 <CAGXu5j+_b-w+e_4rn1D5zH=KF_O=ktz-xV3hEFd1cqSmcWpWhQ@mail.gmail.com>
 <d0647ccf-b2a2-8fd4-adc4-16914b68ffbf@kernel.org>
 <CAGXu5jLta_gWu+5SXMrkQY3pTVnZ43CAK24Z5xAXdzJMwYWojQ@mail.gmail.com>
Message-ID: <62918747-3306-b1ba-9a0f-92d52b84438f@kernel.org>

On 4/9/19 10:57 AM, Kees Cook wrote:
> On Tue, Apr 9, 2019 at 9:56 AM shuah <shuah at kernel.org> wrote:
>>
>> On 4/9/19 10:06 AM, Kees Cook wrote:
>>> On Mon, Apr 8, 2019 at 2:32 PM shuah <shuah at kernel.org> wrote:
>>>> Couple of things to consider:
>>>> - will this work on embedded test system with limited applications shell
>>>>      support?
>>>
>>> I was assuming the availability of "stdbuf" which is part of
>>> coreutils, and "perl" which is already required for at least one other
>>> test (sysctl). What do you have in mind for the "maximum supported
>>> environment" (and where's best to document this)? Also, I see python
>>> is used by several tests. Should python be considered instead of perl?
>>>
>>>> - It does add dependecy on perl for running tests - not a problem since
>>>>      kernel build system uses it, however it might not be the case when
>>>>      tests get run on system without perl.
>>>
>>> I could likely rewrite the "prefix.pl" in C, and the test could use a
>>> built binary instead? Or in python (as noted above). Where are tests
>>> being run right now with such a limited environment?
>>>
>>
>> Some embedded systems as I recall with just busybox env. I am thinking
>> shell rather C/perl/python.
> 
> It can't be done with shell alone if we want to retain the unbuffered
> output. Don't we already ship binaries in this situation, though?
> (i.e. such environments clearly aren't building test binaries...) Why
> not also ship kselftest binaries?
> 

They don't build them and run from install. Let's give this a try with
perl and see how this will work. Once you have the emit_tests covered,
I will upload it to a kselftest topic branch and we can ask Kernci and
Linaro folks to test this in their environments.

Thanks for working on this.

thanks,
-- Shuah
