Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AD32F75B;
	Wed, 28 Jan 2026 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571001; cv=none; b=nRIAtXlPHbeG6aH1bwekXwKnkBy7nAgGmaUeo6D/pOePuZlSbt7jXEZYLbuka1AqVoxoLiJQSUoLR6Lb+kFr/nFisRH4Qp54hbWMKcleiVGLS8fWThMAZvSbpcZMgwYHkUitC+rEG0j5pSEgtHmNL0CC/bBpcylKxT1VUoYyTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571001; c=relaxed/simple;
	bh=cRvAp1clxZ2XHsLyr7xiqYHK8H/oaatWuJDOaCSWqmE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=a3/PRHH31m5hcD1Jf7i+Z3CkhIYo92kuv5WznqEAm9vTubviQLNJUCbgLA9N/69u31Oz4mMbRit5KsGQYJaYn8KyFJLgMBfuFSFpqErdJg77dVlj9gHoI28U5/Ei02R2XzfzSQbk5ru3IXV+VjPdn0xN3wjIu4cuGuvg27hT8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=rE5PEdVE; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="rE5PEdVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769570995;
	bh=eeDVqNxDC3DKmDoniWCTLTcY8HnPvFbaJUJt8qR6MKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rE5PEdVEiHy8CHrJpIFBWqbA0El4XXwRuLSXwZS1QojiWKMPLNUfs1M7T9TOKW9SB
	 bHqGxr7O9JRWepTs0BichaNv+AtQSEJbdWbpD3/xGDuD/esoIP3015PpeS8s0hsZER
	 0YFPBB5eWVVlQlj33AUFsxJmDSEfliHGdFG2kIZY=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 773A80E3; Wed, 28 Jan 2026 11:29:51 +0800
X-QQ-mid: xmsmtpt1769570991txehwjyf9
Message-ID: <tencent_347CD8D5F7FC23EFE58BBACBA98894DB6E05@qq.com>
X-QQ-XMAILINFO: MVuDTlnnQDnqJ3NdZ+upV0adVDMcAHxrqO7+CcwkIQCe6b13NWAKiU5/UllDpc
	 BSj7+KSx3bYkkkhWbLOzQ3CMr5HBZ1X1YgA0zNIRaMx+Ouiv5LIZ6ijH193NxBIPJ1MRbu10tz2P
	 5DzfeamchVBAIvhQDweGMe1KKIHUnHcN/nSttJwI/AVHBuiTJJDB+HmpsMFECrwj2LMT+r296vYC
	 +/8cYBRaJ9M0/WtSIcxUFoc9rSSxOQpopnbVgV7+/Kss+wdmT8m+Z1HU+LMsbjxkCq597uM6DQjk
	 3+tPTX055Sol5D5xiJFapwkoXYHcu946P/THnBmqTEu30+FdXPwPg9e6ebYsPdMgs7c0uqyIHA2Q
	 w9FRvuTGFhmFTeapuz0r3W5uGiBfMtWSczDuS/rupRpe/bL5GUxnLdlnJOEHkAzrJoqdHyXtekJv
	 8oRsElXt8IGjC2trpGrR7Ze2ToQ7ddlAZ08IZowzrbIMVhlldbycKd2LuAwJsau4dEmzHlNP7mDh
	 V8QA81ZszHNRdqmN4T+3u5L0CHGxqVcmZZvxhb7W5JT9OC34bB2e4pHVc/bczRj+z/N1IisWqMrw
	 /EABCEwb9REEg7sWeQWxBXAI8Mx8xAyZsZUnqPTZULU5OFNeNsfb28oJRYYisAUjudMf5VpGeU9E
	 bwBqbYgsu1oIEjSOwPCaERDTHYZFuNUxMuv0Zje3kwlVMUIZO55SlRKulJvrdpnfl6WKu4sPN8bq
	 Y4gVwv/eN9KR3hHUXPZUo1sUo0xS5yy9BMPpROi7z+c0dpBxyBmVEOAx50klCycFBOD0MzvZPuHn
	 6mDwXjA9GpG6RahjkDf4oYtoc7DtowENJTUwdRUxPLtZpdbWR+2GUUCauqzg8tdVqkj2qJEmK75K
	 TSvc8OIhQSJtzvcHDLAXw0Ez/U8qph8JrPOtmqhiZDAdeY/Dk1jHLkN5TPh5cUsYpoZ/Ra2Kf1bi
	 aT2VrP0S5ZoaScpQ7j1ZlbB4axKyR4ZbwORGVdhhC/2QIXjaOgwxJGaMOwMghlQzqH1Yc5KV0kbw
	 2/X2hHOt26qnqXbIwu7hz0gXLDgMt0UbwskvXClXbrgumwOKFkg+0ObckE3dbOyWCSN6yaqA0B4o
	 AzGKuVDox+cuLnyjY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [PATCH v2] selftests/futex: fix the failed futex_requeue test issue
Date: Wed, 28 Jan 2026 11:29:51 +0800
X-OQ-MSGID: <20260128032951.409044-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <878qdic3i0.ffs@tglx>
References: <878qdic3i0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 27 Jan 2026 19:30:31 +0100, Thomas Gleixner wrote:
> Extremely high?
> 
> The main thread waits for 10000us aka. 10 seconds to allow the waiter
> thread to reach futex_wait().
> 
> If anything is extreme then it's the 10 seconds wait, not the
> requirements. Please write factual changelogs and not fairy tales.

10,000 us is equal to 10 ms. On a specific ARM64 platform, it's quite
common for this test case to fail when there is a 10-millisecond waiting
time.

> That's a known issue for all futex selftests when the test system is
> under extreme load. That's why there is a gratious 10 seconds timeout,
> which is annoyingly long already.
> 
> Also why is this special for the requeue_single test case?
> 
> It's exactly the same issue for all futex selftests including the multi
> waiter one in the very same file, no?

Yes, this is a common phenomenon. However, for the sake of convenient
illustration, only the case of requeue_single is listed here.

> Why do you need an atomic store here?
> 
> pthread_barrier_wait() is a full memory barrier already, no?

Yes, there's no need to use atomic here. However, in the kernel, WRITE_ONCE
and READ_ONCE are more likely to be used. Since it's particularly difficult
to use them here, atomic is adopted.

> What's wrong with reading /proc/$PID/wchan ?
> 
> It's equally unreliable as /proc/$PID/stat because both can return the
> desired state _before_ the thread reaches the inner workings of the test
> related sys_futex(... WAIT).

Is it possible for the waiterfn to enter the sleep state between the
pthread_barrier_wait function and the futex_wait function? If so, would
checking the call stack be a solution?
Maybe using /proc/$PID/wchan is a better approach. Currently, I haven't found
any problems when using /proc/$PID/stat on our platform.

Thanks

    Yuwen

