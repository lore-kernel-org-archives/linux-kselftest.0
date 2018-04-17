From: mbenes@suse.cz (Miroslav Benes)
Date: Tue, 17 Apr 2018 10:06:04 +0200 (CEST)
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <20180416150230.6ys6ya7alpodxp3d@pathway.suse.cz>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1804131118080.17969@pobox.suse.cz>
 <c9f4b440-c672-e45f-ddcc-63548b0411e2@redhat.com>
 <alpine.LSU.2.21.1804161329040.23118@pobox.suse.cz>
 <20180416150230.6ys6ya7alpodxp3d@pathway.suse.cz>
Message-ID: <alpine.LSU.2.21.1804171004410.12184@pobox.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180417080604.sBRirCKz8Mmg8ywnf0yujOneUM97J28VRHWy5kfMvMo@z>

On Mon, 16 Apr 2018, Petr Mladek wrote:

> On Mon 2018-04-16 13:33:55, Miroslav Benes wrote:
> > On Fri, 13 Apr 2018, Joe Lawrence wrote:
> > > Thanks for reviewing.  I'll hold off on posting v4 until Petr (and
> > > others) get a chance to comment.  Perhaps there are other tests that
> > > would be helpful?
> 
> > I think it would be useful to have tests for a stack checking and a 
> > consistency. Nicolai has written some lately for our internal testing, but 
> > it would take some time to transform them appropriately, I think.
> 
> The future of the stack handling is not clear at the moment. We should
> wait how the discussion goes before spending time on test cases for
> the current behavior.

You're talking about something different. We have to check stacks of all 
tasks while patching in order to achieve consistency. Tests for that would 
be useful.

Miroslav
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
