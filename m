From: pmladek@suse.com (Petr Mladek)
Date: Mon, 16 Apr 2018 17:02:30 +0200
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <alpine.LSU.2.21.1804161329040.23118@pobox.suse.cz>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1804131118080.17969@pobox.suse.cz>
 <c9f4b440-c672-e45f-ddcc-63548b0411e2@redhat.com>
 <alpine.LSU.2.21.1804161329040.23118@pobox.suse.cz>
Message-ID: <20180416150230.6ys6ya7alpodxp3d@pathway.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180416150230.zvL-JoqXZADLvM1taMpLS8Pdf4jDMf7xTBdrZ-2A_lU@z>

On Mon 2018-04-16 13:33:55, Miroslav Benes wrote:
> On Fri, 13 Apr 2018, Joe Lawrence wrote:
> > Thanks for reviewing.  I'll hold off on posting v4 until Petr (and
> > others) get a chance to comment.  Perhaps there are other tests that
> > would be helpful?

> I think it would be useful to have tests for a stack checking and a 
> consistency. Nicolai has written some lately for our internal testing, but 
> it would take some time to transform them appropriately, I think.

The future of the stack handling is not clear at the moment. We should
wait how the discussion goes before spending time on test cases for
the current behavior.

Best Regards,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
