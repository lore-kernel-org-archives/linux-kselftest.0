Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080A26AC3
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 03:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778038538; cv=none; b=DqSKNwLQAyQUvs3PRjstTcTjDjt3YYwfkyccVUob4bwYsQ6TxTgKv9WO6Uqf0MYKP+On+PXszPrx5UKzPSEQGBXuqimrhASTq0IGTxA3R/ciXcXvRq0fiFhP8WmeCpujShmMvFz6uOqY73Amc1NIPbNB24SOciqA9O/X3BrpdlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778038538; c=relaxed/simple;
	bh=FEJxm6XNG05yUoH3Q/u6mf1fdRhki27oUHGVH5dqOhY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=DckfAAO4TXq3uJ9g+4SWbUyrR8PQITKLS9W/NKSPg6/8M6Mw8u6Xw3e9JjWeVJrhcJbeNf3J73oWjhU8oaZNPXRMWdUI7vDIqZMVxZuSColmUWQWTAG1v52shNHq1SIVKevI7z2DgwxyHcU9KdI4roArcnpR3HfSrOz+6z8fJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ujUPVugl; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ujUPVugl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778038531;
	bh=FEJxm6XNG05yUoH3Q/u6mf1fdRhki27oUHGVH5dqOhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ujUPVuglqJqJfu3ecVc72Xal0tPHVi7kEMVeItRMtwYD1TfpYxr4PIfLgnsvD51kO
	 SRC7tK0Y5CJsDhQYfDGawcvkiouHu9QodnRWymAR5u8muVB1xW178rAvR6RscP+3uN
	 w2Cv4V6E9GqHEQ07s/hOEsbjXnvoEek7QQyVRNGU=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8DBA9009; Wed, 06 May 2026 11:35:27 +0800
X-QQ-mid: xmsmtpt1778038527tz1eamx9w
Message-ID: <tencent_86DB55E71C2B0FEC8BAB8BA6C88E9B679C05@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Juy83jGeki1B94Pb6KB9Jrz3GPb0RZkvonQZMb9TlZ3issqTafNy
	 J6KOhtVYzH+jjNItMkuW9EC/GzRyRm9qik0Z96U6f0g0saWu0Gr9e4lPmIEIB0UdBgFB1QcOUmfb
	 e8AJAnnD0CUs1Q2hUb0fXYPC+5mjvZl65Ac3vEdn7tQD62SFPUZPVOtxpJ3vK/EsyLMslV4SdOU/
	 /FQ1HyAP3KCzotbnCLkY8cF2Gv2MFHqvjIEjJ6oq4IxHdm6D6O+eaW/dRlklzcJXtNVfGpFT4uFt
	 n0BVR58lmmEQTRxB/jruDwMz8lIMStU4VfbEAXlV7N7CvP+Yy9JIdU+97V5/GTtPGweSKMOpARfB
	 6gA2wvg9aR9oLIlJTe3224juiDROZ96Ft2vDsI30iMHMZOL6I/56qp2sAbRKa6XZVrwb9h7wwulf
	 Yjq7qjIhm1D0vPW/C/jrSrz/fN21AAGmxOqB4w/MR3ARyaeZZSSEiKLtvH7idxCfI7+ZaEC6Ac4O
	 5SV7vkunRY/CwxY1AMtEIZvdi13CI++VIvHS3P3M7s3RC/L5JrzdhMNwrAVVWzr/2s+BvlnVAMhq
	 Tg7VKXrT/brtbdmIjgGL7Mg60suwpKdgNJmDMd1wNQiulgoPRS4cXem5n17yap6bOlS9f+2esiml
	 85SanLVhMtxsym79tyZLVgiJIbjw2hfL0ndMY2V/XVug/LNpeokeed716Fse6keuLxe4IGd5Kpgh
	 Vjvp8q3I7+6L82IOKwKPSrred2xZxixQCDe+0vLc97JQGZrucIUOYByBNA/ktd806RcbfxZFkErU
	 W5GPdHhGdmYQllI/bBgDHjXBtx+sYOJ3vKc8BTltZQuL8J3NcByde9Qt4hirCOZyKBD+zOXo3WEv
	 jaVkZt5GQ/HJwpmfm6EuBlJqxy79HCWxEkloLGUDnLIwqGMByE/uHJV2Ul6AkyQcZJp7EFfAcTwY
	 aH+1ylhlLOXiR6X8DwiG5K0B2Qjjtjz+DTARR9KvSUstfr/5EzSTT+DOZ5DQC9pKyEv4Lli1djBE
	 upTOp3m8LSDUqLbvAeCLw1V0e7uA362zEUjCaLg7S9yfwAJ/jf56QVasc6N1vBOakNOTk89hJmab
	 k9IlW8LbeAAaRIxp0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: akpm@linux-foundation.org
Cc: andrealmeid@igalia.com,
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
	tglx@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [RESEND PATCH v3] selftests/futex: fix the failed futex_requeue test issue
Date: Wed,  6 May 2026 11:35:27 +0800
X-OQ-MSGID: <20260506033527.3984556-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430164127.b8d68639a5c1708411cf7508@linux-foundation.org>
References: <20260430164127.b8d68639a5c1708411cf7508@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on Thu, 30 Apr 2026 16:41:27 -0700, Andrew Morton wrote:

> So you're saying that this test is generally flakey and annoying?

Yes, this test item fails occasionally on the Android platform.

The following are some responses to the code review of AI :

> Does this leak the pthread_barrier_t resource? Since pthread_barrier_init()
> is called to synchronize the newly created thread, should there be a matching
> pthread_barrier_destroy() after the threads successfully rendezvous?

Yes, the resource was not reclaimed by calling pthread_barrier_destroy here,
and this issue has been resolved in the latest version.

> If thread creation fails, EXPECT_EQ logs a failure but permits the test
> execution to continue. This leaves the thread ID as 0, which would cause
> subsequent functions to operate on uninitialized state. Could this lead to
> cascading failures instead of safely halting the test, and should it remain
> an ASSERT_EQ?

Yes, this is a problem. It has also been resolved in the latest version.

> Is it safe to ignore the return value of futex_wait_for_thread() here?
> If the /proc filesystem is not mounted or accessible, opening
> /proc/[tid]/wchan fails and returns -EIO instantly. Because the return
> value is unhandled and the fallback sleep was removed, the parent thread
> could immediately proceed to futex_cmp_requeue().
> This seems to reintroduce the race condition the commit sought to fix. Should
> there be a check on the return value to ensure the test handles environments
> without /proc properly, or perhaps a fallback delay?

Yes, the situation when the /proc/[pid]/wchan file does not exist should be
taken into consideration.

yuwen

