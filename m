From: shuah@kernel.org (shuah)
Date: Tue, 16 Apr 2019 14:05:40 -0600
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
In-Reply-To: <20190416135923.4e9d32e4@lwn.net>
References: <20190416142651.7048-1-shuah@kernel.org>
 <20190416092610.78b462de@lwn.net>
 <90615fb4-ff56-af72-f4ea-f3dbc3db26df@kernel.org>
 <20190416135923.4e9d32e4@lwn.net>
Message-ID: <65a59c5a-f042-a77a-17ab-02e364b065a9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416200540.30_bgRHa2hQ1IGgXHbQxDcUxOkRmxzFcQtHypskKvZQ@z>

On 4/16/19 1:59 PM, Jonathan Corbet wrote:
> On Tue, 16 Apr 2019 09:50:16 -0600
> shuah <shuah@kernel.org> wrote:
> 
>>>> +Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
>>>>    
>>>> -  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
>>>> +  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest
>>>
>>> Is there a particular reason why this variable needs to be set in the
>>> environment rather than just in make?  More importantly, though, I don't
>>> think this would work if you run it from the KBUILD_OUTPUT directory.  What
>>> you're really doing is running with a separate output directory, right?
>>>    
>>
>> That is correct. I am matching the instructions in the main Makefile:
>>
>> # kbuild supports saving output files in a separate directory.
> 
> So my concern was right, then: this is not a way to "run from the
> KBUILD_OUTPUT" directory; that seems certain to confuse people.  I'll
> apply the patch so that the commands are right, but that could maybe use
> some tweaking.
> 

Yes. I can see it could confuse people.

I can tweak the wording to add that the working directory is the kernel
source dir, and that the command should be run from root of the kernel
source repo and send v2. The same changes probably need to be made for
the O= case if that isn't clear.

thanks,
-- Shuah
