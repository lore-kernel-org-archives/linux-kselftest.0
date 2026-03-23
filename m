Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF801E5B88
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298657; cv=none; b=UNqRVxFPegkpoDI+8ThlFQeRILgnqKvhvlcc5+a3fFpoJDOzPiudUe27bCVzwp9qU74wTkhtN1QwFBsJ+KBdNxUBFso6Ocmx2xC0OUIXpDj/XU2DOvUq6MANSSIx4zv9gKvNsAX87DngdIs9eYYB1Tf/vy/oom4Itoet4bb5UC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298657; c=relaxed/simple;
	bh=z0O2JeKzmzL5hHXagEh4QyuQ9OwWi3ZJLz/wLqZWrDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj/L4jpIblGjymxU66WZTApjPeF8ouQiKfKOI8X4/vm3yWSito43rA7oed5XsL4DacYUgO78UkXDOAhRyxlTy3vcVpYVOt2aVGwoyAykoO1BY/nsCpFA5vJA4ZX+zBV4drAIHMI49RgExnWp7Fq7K9+JOuua8M320A+odPNJ6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uL9gyU3H; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uL9gyU3H"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b04c9e3eb7so25465ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774298655; x=1774903455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4noW3+Hqv98gL/95V6fTB2a+kJKQFh5AF7H7JodbRI=;
        b=uL9gyU3HqPKAMB4RSBDVdvIhQuiFbD03jXqGHO8bo7OK6YXGRiV7ge7pzv0CygMMqs
         ZRrb7syZy1VoDCHx659q4do3giRqmt1MmI3OLjOKfIs9/ep2I+lkwu+dyAjPV8HFCdqI
         r7NHvgNk27HftCn7y6BcN0NUF+4zXcHgXXlvZmDMZ07AOH97cOVMGhNehLLLG+E/tOah
         nI3Grl7MqLjdXyQdZR6zSMYcVPKr5IoKhorLaZBJPR4HqopIP5gfRiQCAl29w+sDHmyB
         sxOLUUH/WV9FwA0ElG/Mz/qqdPuibIoleNC39NfhW9qyfbhF4yHyFQoFFXVQM0WaqeRO
         rl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298655; x=1774903455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4noW3+Hqv98gL/95V6fTB2a+kJKQFh5AF7H7JodbRI=;
        b=BVTkT3LyA8GRSbPTn2XXIAbXZk558ExdxsbgNkNi+QW6EsZKiKPTUpU1mZ288QDCP9
         VzK/xbnZwA/xk1MFq6Rn9h4QbPuPsOP3bmmkrhrG+ZBB3U16bc7Q0EF0zSvWCw3oXTrf
         kmNI5r0V9q5kiJ1m6qBcr5MrlKZCec12+5ptipGSXaSxUwAlhEigOPNkZLf9F2A6cm9l
         GWa9DAMlUSHiR1QNDiU9wVLAM/EXFTcbju0DuLc8/Hwl74Z4b/D38477ce9xpAeJtSfA
         hS7oejKE4evksclcRY3Grxza+uF2IWBrlXVkHEsp9VgT9veNztXHQID+gYa21HaWWpqD
         ioNA==
X-Gm-Message-State: AOJu0YxDsrIvzvJVvBdjB4BcbdE4QI7bF7IlgeiNTLZBMSPZo7CG+lKW
	wDBtygvtJ1YKxUJts7YyBHE9Y8c61NVy1u4hw1IYxfhLPYr4DcDUsBaz5zhQUasIvA==
X-Gm-Gg: ATEYQzy7k/a5UDOaY+zccwIUAA3CwEs51LNG4xoBZ/v0d7wAhs07h6RwHEzCZHVpvbw
	YBVYhUtbn5HGhhDfyCUTmDITnV0xo8zfuWeB5ehQCLJaNx6eZ9Rt+4ablhjh1c73Q+XG/sWFST0
	dZyCr8DRiJks0NDlNAq0SoH5uRHzJmADrQ+UDrpyHTMvhAr0XXi/wA+SnXv6Og9bKqaU+YDxIa+
	AzoxljRyeAUvV5w03i/XMKOTTSzNb2wtBuuSe7PaUJRuKqhE9xMKapWs+rmiPBzerfKBhHd85ib
	veo/4wKe81Pgii9USqQ5UNi0c14Ms/j5IY9NjezK8HP7Nl6lWDP+7tr0mlf0sWw0Ss3jFGMknQS
	jgND/uf0OWyFMCmqvgyGuO+UGqTgNH1fVzQf7a5IRz3iWYKfooP47P4itqQeaQIKlq5MdhFtYIo
	u2RuzF9Zz5enGBoUcXK24N6mN89FzzNXfJV4mv9QtNIWQlhhcNod/UuGJqoc3wPw==
X-Received: by 2002:a17:903:2290:b0:2a9:5ef5:399b with SMTP id d9443c01a7336-2b0a67336damr205655ad.19.1774298655161;
        Mon, 23 Mar 2026 13:44:15 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa79a8sm12398938b3a.2.2026.03.23.13.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:44:14 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:44:10 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, pratyush@kernel.org
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: add test for double
 preservation
Message-ID: <acGmFN56v0LS12VO@google.com>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260323203145.148057-3-pasha.tatashin@soleen.com>

On Mon, Mar 23, 2026 at 08:31:45PM +0000, Pasha Tatashin wrote:
>Verify that a file can only be preserved once across all active
>sessions. Attempting to preserve it a second time, whether in the same
>or a different session, should fail with EBUSY.
>
>Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>---
> .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
>index c2878e3d5ef9..37c808fbe1e9 100644
>--- a/tools/testing/selftests/liveupdate/liveupdate.c
>+++ b/tools/testing/selftests/liveupdate/liveupdate.c
>@@ -345,4 +345,45 @@ TEST_F(liveupdate_device, preserve_unsupported_fd)
> 	ASSERT_EQ(close(session_fd), 0);
> }
>
>+/*
>+ * Test Case: Prevent Double Preservation
>+ *
>+ * Verifies that a file (memfd) can only be preserved once across all active
>+ * sessions. Attempting to preserve it a second time, whether in the same or
>+ * a different session, should fail with EBUSY.
>+ */
>+TEST_F(liveupdate_device, prevent_double_preservation)
>+{
>+	int session_fd1, session_fd2, mem_fd;
>+	int ret;
>+
>+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
>+	if (self->fd1 < 0 && errno == ENOENT)
>+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
>+	ASSERT_GE(self->fd1, 0);
>+
>+	session_fd1 = create_session(self->fd1, "double-preserve-session-1");
>+	ASSERT_GE(session_fd1, 0);
>+	session_fd2 = create_session(self->fd1, "double-preserve-session-2");
>+	ASSERT_GE(session_fd2, 0);
>+
>+	mem_fd = memfd_create("test-memfd", 0);
>+	ASSERT_GE(mem_fd, 0);
>+
>+	/* First preservation should succeed */
>+	ASSERT_EQ(preserve_fd(session_fd1, mem_fd, 0x1111), 0);
>+
>+	/* Second preservation in a different session should fail with EBUSY */
>+	ret = preserve_fd(session_fd2, mem_fd, 0x2222);
>+	EXPECT_EQ(ret, -EBUSY);
>+
>+	/* Second preservation in the same session (different token) should fail with EBUSY */
>+	ret = preserve_fd(session_fd1, mem_fd, 0x3333);
>+	EXPECT_EQ(ret, -EBUSY);
>+
>+	ASSERT_EQ(close(mem_fd), 0);
>+	ASSERT_EQ(close(session_fd1), 0);
>+	ASSERT_EQ(close(session_fd2), 0);
>+}
>+
> TEST_HARNESS_MAIN
>-- 
>2.43.0
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
