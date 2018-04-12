From: mbenes at suse.cz (Miroslav Benes)
Date: Thu, 12 Apr 2018 15:28:59 +0200 (CEST)
Subject: [PATCH v2] Add livepatch kselftests
In-Reply-To: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
References: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
Message-ID: <alpine.LSU.2.21.1804121526110.4758@pobox.suse.cz>

> Questions for v3:
> 
>   - Should we split off the atomic replace and shadow variable update
>     tests so that the this patchset could be merged before the ones
>     listed above?

What Josh said. If we merge it almost together, there is no need to split 
it.
 
>   - I didn't remove any of the sample modules.  If anyone thinks any of
>     them should go, let me know.  They serve as nice, simple examples so
>     I thought they should all stay.

Ok

>   - Module naming convention: to make the test script easier to grep
>     module names and filenames, I broke with livepatch convention and
>     used underscores instead of dashes.  I didn't think it worth the
>     regex foo to flip back and forth in the test script.

Ok

Miroslav
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
