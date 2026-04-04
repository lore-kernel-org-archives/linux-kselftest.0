Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E815310785;
	Sat,  4 Apr 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296939; cv=none; b=OTLlx/eUd/Wse+jQarRjHt64rtcw/PqJ/yNRCmzodxehXIwNFAwLUmxLwh+pvY7vHEofnKhDNugtp4yKwZxoaNKbILFmkfM7zQ5dpRWe6A9HfJxrn0QEKnYXjLFIoRC5K3xCzGkDuhJ6Vy1Eiq9VwFpLyaP5Q0XHVzXDcjNX9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296939; c=relaxed/simple;
	bh=snSMIj4ZyzLySoCeSAr8jE8/ngtAvFRBuQqkvK8jZT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AjtHDp3FoMQbSW+FYAOHPBIALgklsSikLrcKIefXFdq7tE0lsKQ/moL/DgKZp3hQeqamXk+r9YJY440STwk4h/DWFBFjskBnNU8of5A5K0tc1jou0yw1SDRAOY6EE08VKBQvBSGUiaewjh61AU93aXiHJWLQELjulWiMwP3xkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+7nfSJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+7nfSJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAC9C19421;
	Sat,  4 Apr 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296938;
	bh=snSMIj4ZyzLySoCeSAr8jE8/ngtAvFRBuQqkvK8jZT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f+7nfSJi+F9GCY34zDpGrAXBlx5ZoRW+/sKBWW2fcdNzLklZtfPnBiRiA0Y+YUjpF
	 DdR9n9zgO9qZuTvxpF83au36YdgsacIIfza8a2l4sQci9PHxsPBY0dvphdTNPxeClC
	 OvjInO4t1Cg+OoE6RisEbYEX3V3YihzJRY13aZazHQHsK2m0N73Y6CWV5FKfZssaCa
	 mUmVr0YegANZ7YetPvvjgBfJiuHA2sV5hW5jIPMTbezDMuWDFetYop77L65A17BC7F
	 LC/xEixA9tersbmA8KbPwGp6cAkT/5mIc+/pk+q6AS/DXXYYFbKC0/YTVlIy+mmdlD
	 SSXqNQwGnvbGg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Usama Arif <usama.arif@linux.dev>,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] selftests/liveupdate: add memfd tests
In-Reply-To: <20260403150801.f42e27896fd2da5db6ca3425@linux-foundation.org>
	(Andrew Morton's message of "Fri, 3 Apr 2026 15:08:01 -0700")
References: <20260403194014.3704180-1-pratyush@kernel.org>
	<20260403150801.f42e27896fd2da5db6ca3425@linux-foundation.org>
Date: Sat, 04 Apr 2026 10:02:14 +0000
Message-ID: <2vxzldf3avrt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 03 2026, Andrew Morton wrote:

> On Fri,  3 Apr 2026 19:40:06 +0000 Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> This series adds some tests for memfd preservation across a live update.
>> Currently memfd is only tested indirectly via luo_kexec_simple or
>> luo_multi_session. Add a dedicated test suite for it.
>> 
>> Patches 1 and 2 are preparatory, adding base framework and helpers, and
>> the other patches each add a test. Some of the code is taken from the
>> libluo patches [0] I sent a while ago.
>
> Look like a nice series and it comes well-reviewed.  Maybe my "we're
> all full" policy-making should have a selftests escape clause...
>
> I see that the malignant gaze of Sauron's eye fell upon your work:
> 	https://sashiko.dev/#/patchset/20260403194014.3704180-1-pratyush@kernel.org

Nothing escapes His Eye...

It does raise some good points for patch 2. I'll send a v3 shortly. It
would be great if this series can go in with this merge window. Since
these are only minor bugfixes and no fundamental changes, I'll keep the
R-by.

-- 
Regards,
Pratyush Yadav
