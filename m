From: jikos@kernel.org (Jiri Kosina)
Date: Tue, 10 Apr 2018 23:38:01 +0200 (CEST)
Subject: [PATCH v2] selftests/livepatch: introduce tests
In-Reply-To: <20180410213354.ma5wfe3jc23pzmw4@treble>
References: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
 <1523373354-10801-2-git-send-email-joe.lawrence@redhat.com>
 <20180410200059.loy3hw6tcwdi4m5z@treble>
 <daac17e1-6e32-fce9-51b0-24ec25bda69f@redhat.com>
 <20180410213354.ma5wfe3jc23pzmw4@treble>
Message-ID: <nycvar.YFH.7.76.1804102337070.28129@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180410213801.DFTD_nbURxQw1ObtFE3oyReUd8xN8fCq9h9os9SRGho@z>

On Tue, 10 Apr 2018, Josh Poimboeuf wrote:

> I think CONFIG_LOCKDEP is always a good idea. 

FWIW CONFIG_LOCKDEP mostly enables the infrastructure, but 
CONFIG_PROVE_LOCKING is what turns most of the cleverness on.

-- 
Jiri Kosina
SUSE Labs

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
