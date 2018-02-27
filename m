From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 27 Feb 2018 10:25:44 -0700
Subject: [PATCH 5/5] selftests: futex Makefile add top level TAP header
 echo to RUN_TESTS
In-Reply-To: <20180224214244.GA31352@fury>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
 <bec2e6c01cbf3b2f6dc49e022a2a7543fc7f3182.1519423341.git.shuahkh@osg.samsung.com>
 <20180224214244.GA31352@fury>
Message-ID: <d8c446cb-fa30-ec1f-944a-c7763a3e80b7@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180227172544.dqEukkvsO-DiyfDm3Igl9nhj1kOld2L5gvwaj4q4X8Y@z>

On 02/24/2018 02:42 PM, Darren Hart wrote:
> On Fri, Feb 23, 2018@03:11:40PM -0700, Shuah Khan wrote:
>> Add top level TAP header echo, testname and separator line to make
>> the output consistent with the common run_tests target.
> 
> No objection to the changes, but I'll echo Ingo's request for a more
> detailed justification for why these changes are warranted. We've seen
> this a few times with recent changes to kselftests, I think too much
> might be being assumed regarding the individual test author's tracking
> of the core of the kselftests ongoing work.
> 

Ingo/Darren,

Sorry for not giving a better justification. I should have kept audience
in mind that test authors might not be up on the framework changes.

Nested TAP header example:

TAP version 13
selftests: step_after_suspend_test
========================================
TAP version 13                                           (#Nested header)
Bail out! open("/sys/power/state") failed (is this test running as root?)
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
not ok 1..1 selftests:  step_after_suspend_test [FAIL]
selftests: breakpoint_test
========================================
TAP version 13                                            (#Nested header)
Pass 110 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0

<snip>

1..110
ok 1..2 selftests: breakpoint_test [PASS]


Some tests print TAP headers. This is helpful when test is run by itself.
However, when "make kselftest" or "make -C" is used then common run_tests
does its TAP header and nested headers get printed.

Nested headers are a problem for TAP13 parsers. Hence, I decided to go
with a simpler approach to suppress TAP headers using env. variable
that gets checked in the framework and suppresses the header.

selftests: kselftest framework: add handling for TAP header level

This minimizes the churn to actual tests and framework handles the
TAP details.

futex test overrides the generic run_tests, so it needed changes to
add a top level TAP header. Otherwise, you will see nested TAP header
for each of the individual futxex tests as shown in the example below.


TAP version 13
# futex_requeue_pi: Test requeue functionality
#       Arguments: broadcast=0 locked=0 owner=0 timeout=0ns
not ok 1 # error futex-requeue-pi
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 1
1..1

I can capture the nested TAP headers being a problem for parsers in
the changelog. I will have to send v2 anyway, "make -C" still has
the nested headers for fuxtex tests.

My goal is to not have the individual test authors be concerned about
the TAP13 details and handle it in the framework. I am making changes
to framework and test Makefiles for the TAP13 and other common formatting
type features as opposed to individual test code. Test Makefiles that use
lib.mk don't need changes either, futex needs changes mainly because of
overrides.

Hope this help. I will do a better job of explaining in the future.

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
