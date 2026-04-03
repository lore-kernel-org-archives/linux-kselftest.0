Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC919D07E;
	Fri,  3 Apr 2026 22:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254083; cv=none; b=ekHprmdRpj4tPmSjT2kKTavSGm+wxvxVHqDgF6z5TRsScU51knL+ihnrHBlnaW3R3pyJy1k5D7QEG06TTCcNXWx5NfWSAqdmX3EAr+diKnMxohucGE2GmlyKy7brmARpcVv2d4ySsAOP8ieOeo6/uQ5R59kH2LAUG9+C3LAsxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254083; c=relaxed/simple;
	bh=Ypektj6k8lvVsXFRGG7d0HYTn/4Igeca1OJ5d724Q2M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=twoywen7iTyo3sL1mJyHdOLxAQdSym0TCxJ0uEU5WGp58NS8H1ZRseURq0Ry8TcOt5ut8lYrd6Qx2uXx3ZfGQ8ilt3Dthk6ZbIOZ1RoGrPRwSPOJBGQupvOUB9Psdx2iMJbsP5DOzHwxAzcJCEhC6qpH4Jhe7Pjp8CwyFclyHq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yA7Q/JlB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yA7Q/JlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983A2C4CEF7;
	Fri,  3 Apr 2026 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775254082;
	bh=Ypektj6k8lvVsXFRGG7d0HYTn/4Igeca1OJ5d724Q2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yA7Q/JlBXj95SHYJSmvCID2o/jxMn6HJRv9G8mMJAMKEt2nWvvUlS9A1VT+5224d6
	 WiMzxyvQwjnCzVDPcL32QSKthHvBIpyjYLntftdO6WoeNsZiVoHtbCQ8uQ087WyfBc
	 baJkCjWIHqN/Qe2gWoLtWMHZDVgd+uBmSQ3O1tgg=
Date: Fri, 3 Apr 2026 15:08:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport
 <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, Usama Arif
 <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] selftests/liveupdate: add memfd tests
Message-Id: <20260403150801.f42e27896fd2da5db6ca3425@linux-foundation.org>
In-Reply-To: <20260403194014.3704180-1-pratyush@kernel.org>
References: <20260403194014.3704180-1-pratyush@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Apr 2026 19:40:06 +0000 Pratyush Yadav <pratyush@kernel.org> wrote:

> This series adds some tests for memfd preservation across a live update.
> Currently memfd is only tested indirectly via luo_kexec_simple or
> luo_multi_session. Add a dedicated test suite for it.
> 
> Patches 1 and 2 are preparatory, adding base framework and helpers, and
> the other patches each add a test. Some of the code is taken from the
> libluo patches [0] I sent a while ago.

Look like a nice series and it comes well-reviewed.  Maybe my "we're
all full" policy-making should have a selftests escape clause...

I see that the malignant gaze of Sauron's eye fell upon your work:
	https://sashiko.dev/#/patchset/20260403194014.3704180-1-pratyush@kernel.org
