From: frowand.list@gmail.com (Frank Rowand)
Date: Fri, 10 May 2019 14:05:26 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190510104338.GB6889@mit.edu>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <78e4d46e-6212-9871-51d6-dd2126f39d45@gmail.com>
 <20190510104338.GB6889@mit.edu>
Message-ID: <86ea0fa1-8ce7-c299-3144-c57fc465c891@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510210526.U3EaFwFEp9VUaA8_LIz7xu5mYp-MDwO2A653_aterFo@z>

On 5/10/19 3:43 AM, Theodore Ts'o wrote:
> On Thu, May 09, 2019@10:11:01PM -0700, Frank Rowand wrote:
>>>> You *can* run in-kernel test using modules; but there is no framework
>>>> for the in-kernel code found in the test modules, which means each of
>>>> the in-kernel code has to create their own in-kernel test
>>>> infrastructure.
>>
>> The kselftest in-kernel tests follow a common pattern.  As such, there
>> is a framework.
> 
> So we may have different definitions of "framework".  In my book, code
> reuse by "cut and paste" does not make a framework.  Could they be
> rewritten to *use* a framework, whether it be KTF or KUnit?  Sure!
> But they are not using a framework *today*.
> 
>> This next two paragraphs you ignored entirely in your reply:
>>
>>> Why create an entire new subsystem (KUnit) when you can add a header
>>> file (and .c code as appropriate) that outputs the proper TAP formatted
>>> results from kselftest kernel test modules?
> 
> And you keep ignoring my main observation, which is that spinning up a
> VM, letting systemd start, mounting a root file system, etc., is all
> unnecessary overhead which takes time.  This is important to me,
> because developer velocity is extremely important if you are doing
> test driven development.

No, I do not "keep ignoring my main observation".  You made that
observation in an email of Thu, 9 May 2019 09:35:51 -0400.  In my
reply to Tim's reply to your email, I wrote:

   "< massive snip >

   I'll reply in more detail to some other earlier messages in this thread
   later.

   This reply is an attempt to return to the intent of my original reply to
   patch 0 of this series."


I have not directly replied to any of your other emails that have made
that observation (I may have replied to other emails that were replies
to such an email of yours, but not in the context of the overhead).
After this email, my next reply will be my delayed response to your
original email about overhead.

And the "mommy, he hit me first" argument does not contribute to a
constructive conversation about a kernel patch submittal.


> Yes, you can manually unload a module, recompile the module, somehow
> get the module back into the VM (perhaps by using virtio-9p), and then
> reloading the module with the in-kernel test code, and the restart the
> test.  BUT: (a) even if it is faster, it requires a lot of manual
> steps, and would be very hard to automate, and (b) if the test code
> ever OOPS or triggers a lockdep warning, you will need to restart the
> VM, and so this involves all of the VM restart overhead, plus trying
> to automate determining when you actually do need to restart the VM
> versus unloading and reloading the module.   It's clunky.

I have mentioned before that the in-kernel kselftest tests can be
run in UML.  You simply select the configure options to build them
into the kernel instead of building them as modules.  Then build
a UML kernel and execute ("boot") the UML kernel.

This is exactly the same as for KUnit.  No more overhead.  No less
overhead.  No more steps.  No fewer steps.


> 
> Being able to do the equivalent of "make && make check" is a really
> big deal.  And "make check" needs to go fast.
> 
> You keep ignore this point, perhaps because you don't care about this
> issue?  Which is fine, and why we may just need to agree to disagree.

No, I agree that fast test execution is useful.


> 
> Cheers,
> 
> 						- Ted
> 
> P.S.  Running scripts is Turing-equivalent, so it's self-evident that
> *anything* you can do with other test frameworks you can somehow do in
> kselftests.  That argument doesn't impress me, and why I do consider
> it quite flippant.  (Heck, /bin/vi is Turing equivalent so we could
> use vi to as a kernel test framework.  Or we could use emacs.  Let's
> not.  :-)

I have not been talking about running scripts, other than to the extent
that _one of the ways_ the in-kernel kselftests can be invoked is via
a script that loads the test module.  The same exact in-kernel test can
instead be built into a UML kernel, as mentioned above.


> The question is whether it is the most best and most efficient way to
> do that testing.  And developer velocity is a really big part of my
> evaluation function when judging whether or a test framework is fit
> for that purpose.
> .
> 
