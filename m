From: joe.lawrence@redhat.com (Joe Lawrence)
Date: Tue, 17 Apr 2018 09:25:30 -0400
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <alpine.LSU.2.21.1804171004410.12184@pobox.suse.cz>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1804131118080.17969@pobox.suse.cz>
 <c9f4b440-c672-e45f-ddcc-63548b0411e2@redhat.com>
 <alpine.LSU.2.21.1804161329040.23118@pobox.suse.cz>
 <20180416150230.6ys6ya7alpodxp3d@pathway.suse.cz>
 <alpine.LSU.2.21.1804171004410.12184@pobox.suse.cz>
Message-ID: <771e3d3b-214f-a49c-20f8-d0e8a4baffac@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180417132530.RMI6wLTO9RUphVPSyG5IPOL2qgrzFvHoKv6Rzx2qyw8@z>

On 04/17/2018 04:06 AM, Miroslav Benes wrote:
> On Mon, 16 Apr 2018, Petr Mladek wrote:
> 
>> On Mon 2018-04-16 13:33:55, Miroslav Benes wrote:
>>> On Fri, 13 Apr 2018, Joe Lawrence wrote:
>>>> Thanks for reviewing.  I'll hold off on posting v4 until Petr (and
>>>> others) get a chance to comment.  Perhaps there are other tests that
>>>> would be helpful?
>>
>>> I think it would be useful to have tests for a stack checking and a 
>>> consistency. Nicolai has written some lately for our internal testing, but 
>>> it would take some time to transform them appropriately, I think.
>>
>> The future of the stack handling is not clear at the moment. We should
>> wait how the discussion goes before spending time on test cases for
>> the current behavior.

Roger that on the patch stack discussion.  Once we figure out where that
is heading, we can create tests to verify that we're accurately
following the new rules.

> 
> You're talking about something different. We have to check stacks of all 
> tasks while patching in order to achieve consistency. Tests for that would 
> be useful.

FWIW there is the "busy target module" test in this patch.  It's main
purpose is to verify the behavior of the callbacks in a situation where
one livepatch target holds up the transition (aka the "busy mod").

If Nicolai has created test(s) that specifically target the stack
safeness, even better for future inclusion.

-- Joe
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
