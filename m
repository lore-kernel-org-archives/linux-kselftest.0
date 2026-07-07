Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C739DBE0
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405523; cv=none; b=AIpxPKJSnR8680pfZTIH6R0mHB5ExT5vyoSaZ9gO67H0CQHojuIgOEUiPXoERR6FhdNKIPkMMud6z55IjjEEZedGt3KjsMadsZxvYIGPH9zhZ4NRdomY846dKFyvooYriqgd9r7IPQhcMlZPEclqM5Rb2jZiB3WQL25nwTTBjmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405523; c=relaxed/simple;
	bh=990ZdfZKmGrvcbNcJTz0APHo5J4kWg+c8Yr+q0TrNAg=;
	h=Cc:To:From:Mime-Version:References:Message-Id:In-Reply-To:
	 Content-Type:Subject:Date; b=S/gAWQniXyBjSQZbiP2ipDFI2ZBB2KFuiL2iQmXAXuuYl9kTwK0RH13qagYGTCKLCxUXzZVIaTl79BlH98mtbCkq1oLV93/bIg/PRxxN5TSyKgXyPZGwPqgxw1Ort94OBRUccbTQDdAvdKxsHgt5YU5IaEYhbnAyMElf5lteSIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HmhIES5t; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HmhIES5t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1783405513; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ghULqfOG2OiM+NWRpdwQoOqUFkQmBDMnnbFJj6vRT50=;
 b=HmhIES5t8SgNfdNdmy6iddgU7/27ddha/kj6/k18ah4DbAOTIkGokekLLfF6beOLxVSexR
 j2GcutlV8HfvKJvZ+K7N/DPoQ2wf2KX76f/hRPooWdDkWl1zXHOtd5ZfDa3FH8jcwzE+FQ
 3dtvY1QUpFV+SrCHQPa2259tv8Jf8j4Mm2EU/IBgt44XRZ9edtRBzSMeykPmaK1TfqhSEZ
 2XcQrDvanrYdBnJalp+K7Yl/s+DshsE8NqEPi6Vbm3EG5/XsDjEmxsHP5uJwTBp8mGtEzr
 LwLPDG7AJjfRN+mUwij0vCJntmphpYQX7c4eNLexNflsH5pxE6C/LdLLLkl1UQ==
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-mm@kvack.org>, <muchun.song@linux.dev>, <shuah@kernel.org>, 
	<wangyijia.yeah@bytedance.com>
X-Mailer: git-send-email 2.43.0
To: <akpm@linux-foundation.org>
From: =?utf-8?q?=E7=8E=8B=E7=BF=8A=E5=98=89?= <wangyijia.yeah@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260704203616.1ce10365e07c746f1e805cab@linux-foundation.org>
Message-Id: <20260707062505.3171552-1-wangyijia.yeah@bytedance.com>
In-Reply-To: <20260704203616.1ce10365e07c746f1e805cab@linux-foundation.org>
X-Original-From: wangyijia.yeah@bytedance.com
X-Lms-Return-Path: <lba+26a4c9bc7+8250fa+vger.kernel.org+wangyijia.yeah@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH RESEND v3] selftests: mincore: fix the readahead check on large base page sizes
Date: Tue,  7 Jul 2026 14:25:05 +0800
Content-Transfer-Encoding: 7bit

On Sat, Jul 04, 2026 at 08:36:16PM -0700, Andrew Morton wrote:
> I'm not sure this is a good thing for us to be self-testing for.  It's
> poking pretty deeply inside the internal implementations of
> kernel-of-the-moment.
>
> Oh well, I guss if the test suddenly starts reporting errors, it might
> be something we want to look into.
>
> Thanks.  AI review might have found a couple of things of interest:
>       https://sashiko.dev/#/patchset/20260703125253.3016281-1-wangyijia.yeah@bytedance.com

Thanks for taking a look.

After thinking more about your concern, I agree that teaching this
selftest how to compute the expected readahead window from sysfs
read_ahead_kb is probably not the right direction. The failure is related
to mmap read-around behaviour, but adding that policy knowledge to the
test makes it depend even more on implementation details.

The actual failure I was trying to fix is narrower. The existing test
already expects a neighbouring page to become resident after faulting the
middle of the mapping, but it only scans after the faulted page. On the
64K-page arm64 system where I reproduced this, with the default 128K
read_ahead_kb setting, the file-backed mmap fault on page 32 makes pages
31 and 32 resident. The original test scans from page 33 onwards, misses
the resident neighbour at page 31, and reports ra_pages == 0.

I tested a smaller version which drops the readahead_window_pages()
helper and the new skip logic, and only changes the existing check to
scan both sides of the faulted page. On the same 64K-page system, the
original test fails reliably, while that smaller change passes. So the
sysfs/read_ahead_kb logic does not appear to be needed to fix the 64K
failure.

I am thinking of sending a v4 in that direction: keep the existing
EXPECT_GT(ra_pages, 0) check, but make it count resident neighbouring
pages on both sides of the faulted page, without trying to compute the
expected readahead window in the test.

The other possible direction is to remove the readahead assertion from
check_file_mmap entirely, similar to the tmpfs case, and only verify that
the faulted page itself becomes resident. That would avoid testing this
implementation detail, but it would also drop the existing coverage.

Would you prefer one of these approaches?

Thanks,
Yijia
