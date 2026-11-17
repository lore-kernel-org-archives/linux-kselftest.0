Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924941;
	b=pw7r5klgyNRdkOpuk4mDMOyX0WEMf4RwfSyAt4e+003Jp4X+iaekqaSGPq7EDuUfa+bY
	 EY0+zm8QouJd4wohbZKorVYwVzrV/1stEHuLaGkYyQkbbA1i6qmRXE7t+9uW8egED+qSS
	 U36o41Tc66NDqUUSBvWlMjlKB+kdd5c/T4NaU8aqm3ux0dtpKwpK7shXJsjSyZBcIHed/
	 uePWDd5BWYSaQKuNZ2XKvXCjujkbJQ3ICxNvES/o+tRsQV2vr+L71zA4gwQ0FmjMBwTyH
	 SLAw7dubj9He4NQ2ZjkKTynaxMeNiEjpGzXKvcVJUjgZ5zJpcVxwdPoEH+/ySjNw6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2RHE0WdGEbjPWDkMf0iGIhHWxmh2f32hvFeh5rnzwFY=;
	b=XRa3ARMmPAzbnGcnOAyrWx/US2zkQBFQlx+irT8bzZU2cjnu3nXHlAoXKW4xcDH/i8RM
	 Yhhy3azzzufwG+P3VamBgvg4j0/Vifl0GmaIkyJhK1kOqDYG7b5gqHjLmS7lxyrR6DRyW
	 rrjKiq2qjo07jdKnpg6AaFbVA7Ddz/tvRtKdgc3bhv7LFCoO/BlvHBwp72442qJxVHVh+
	 9b1ptQBpdTV65s27QpfNAYrprQsUGAHFtYYXQUwnyfoJonmXipYhv44TcCh+XJ2UhxM9X
	 imLWL8/RXmXzdjWrNXM2yVpGMuOXrH6u3EtzGR/EtAOglg/0PMCoU50s3mIclzSRWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeIqsnxq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 89845606A89F;
	Tue, 17 Nov 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeIqsnxq
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A05F91F000C5;
	Tue, 17 Nov 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924941;
	bh=2RHE0WdGEbjPWDkMf0iGIhHWxmh2f32hvFeh5rnzwFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IeIqsnxqGhWy1nGaOhD6dbmWmQM5oLrQVWBXqdq0FIbniop2B1/vbfaZWluwO/zlK
	 6FKOsXH2kYicWduDlNjZmiM8zySW4UYs+Q7r2lRKVDSA2P3UlKVJfNY+Vwwap1mi+U
	 jq561+NX/MdJx2MxaVtRORTPdAZ/00AB2YcDzDllpvNrztjlrUaOmEu5o1v3SqQ8b7
	 S91vagx8rDHGBVrZXiIOCy2PvqQJhR+dTTScO2rxHAHWq+JTUTeklJIGQifnkLRanU
	 ikmiuY+am9Nr5aim8pc1xybIxmO3DqfdNFbV36L91sm9PywtxlgK6qH5BJCr/8fijI
	 sFyznSNtWoiog==
Date: Tue, 17 Nov 2026 15:15:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: brendan.higgins@linux.dev, david@davidgow.net, raemoar63@gmail.com, 
	bartosz.golaszewski@oss.qualcomm.com, dakr@kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 13667453960@163.com
Subject: Re: [PATCH] kunit: unregister software node when fwnode lookup fails
Message-ID: <crvpi47hdp53aslf62q63z6mhnynqomf7yn4vc3l4p5p5jdlfu@4ktkrkssiua7>
References: <20261117100723.667634-1-yijiangshan@kylinos.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117100723.667634-1-yijiangshan@kylinos.cn>

On Tue, Nov 17, 2026 at 06:07:23PM +0800, Jiangshan Yi wrote:
> If software_node_fwnode() returns NULL right after a successful
> software_node_register(), the error path leaves the node registered
> with no cleanup. Unregister it before returning the error to match
> the behaviour of the other helpers in this file.
> 
> Fixes: 9fdbdb528488 ("kunit: provide a set of fwnode-oriented helpers")
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
