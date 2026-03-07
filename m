Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A930DD16;
	Sat,  7 Mar 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853946; cv=none; b=g70QWjTNhftUvCcEVzck7SsDziiywHYlTjvh+NZFMJy76FFMezYLng+1ACj2E5xMskbKl22FQCAPxwKAi0r6H6aimuq67FY/LUVmyVAKsKQlBgI/a2IoJYXuBCZnEOPxp8zzrH5GW8ETF9SSMasEqI1/YTEDwYV3OSrgHj8s5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853946; c=relaxed/simple;
	bh=vV2tyrzl9E9pm6D8j7bYs2l57WznKFyu9SrvQNvLMks=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2EtjVhNVVRfNEIQBrj5SO0vy+7902p/l+suAsBX7hzeLfP+A3bjNBSdkHFkBMrAAs+3Il5uY+e7GtoVcpd0mUWS3fcALGkjcVl7WgSHltqODXyjdvklH5I9sUbynOlJ0hFgVV88axSTaD9zmYhd4x7AouIiNPbNNQehe99I+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMtTzdHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMtTzdHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF320C19422;
	Sat,  7 Mar 2026 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772853946;
	bh=vV2tyrzl9E9pm6D8j7bYs2l57WznKFyu9SrvQNvLMks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OMtTzdHzLVmYPb3/8OSUdv0i4ChDfL1i3OAEq+N/QoHUdwYA0KzlMD+iDyWc/JQzE
	 xkdx98YgWk6C7rmvdfQv76OiUlUZx2U26xKT88Gt0Kjnp7rXYdih4y3NXuwE3rqYRB
	 pXnTpMU2qJVE80jbQXlwMUKgdxdh0uizhIh+lDkHeZON5rFckZbgHHWHzllnvt+aKB
	 M2803EGk87yLIFKV+WT2XqsLRWObs6ypW6WRE2TTGJtbOD78xAivbkUd1IigDJztTT
	 8a8CDRDN8+1Dim36Vvob8kt8KXajMx7PLDag6R2VyvKgIP3qbaYpeg1AqTDl6IN9/R
	 17sPiOMqyXg/w==
Date: Fri, 6 Mar 2026 19:25:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Aaron Conole
 <aconole@redhat.com>, Ilya Maximets <imaximet@redhat.com>, Eelco Chaudron
 <echaudro@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org, Konstantin Khorenko
 <khorenko@virtuozzo.com>
Subject: Re: [PATCH net v3 3/6] selftests: net: run reuseport tests in netns
 to avoid port conflicts
Message-ID: <20260306192544.358b5cad@kernel.org>
In-Reply-To: <20260306000127.519064-4-aleksey.oladko@virtuozzo.com>
References: <20260306000127.519064-1-aleksey.oladko@virtuozzo.com>
	<20260306000127.519064-4-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  6 Mar 2026 00:01:24 +0000 Aleksei Oladko wrote:
> Some net kselftests use fixed ports which overlap with process-exporter
> service already running on the host. When such a conflict happens,
> the test fail with:
> 
>   failed to bind receive socket: Address already in use
> 
> Instead of changing port numbers, run the affected tests in isolated
> network namespace to avoid conflicts with running daemons.

Please change the tests accordingly instead of wrapping them all 
in a script. AFAIU it's a simple matter of adding unshare() calls?
