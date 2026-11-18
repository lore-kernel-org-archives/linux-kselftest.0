Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003937;
	b=E3/D9TSkmG2DcgXvpD/e93NCZJRttyBxWDEjGAAJ4M0xzCI0HTFetgG5rZBCzLAziSlg
	 4rFNUPt2ddyayWiFagEw0Cm+srJI21gT38bF6wgCesxdnHJwP4zNyquwbOy1aX38wMW8O
	 QraxEbXZD6b0WCo9NEBknqJ9pEVlkP2o0W/bUF7fcBz6qfrhsQOy5qfpKjT6MEmMT7iSJ
	 wFKbcscmyvPSxrYQuEJgMlggYGt4nN5V62x40+2IMn5/4uGf2t2xYDP1RASkWMpIvSGtu
	 J2eI3Ib+phKpLomMdaB9nVfyUbZMGX0n3HIwlwimcvaqLM1XmZmxUCtZCjCHTrZ9xzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003937;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=oR61j/RwbE31oCS4FJwAhnq3EM3gTMbsa537zhrbpaI=;
	b=zQRY2US37jmhKWqWn9K8xz6tI1hS0uy7XKexjC34A9xy++IAwoR6pzEglGsGdYjU2ffT
	 XET1nzSsSJEXv1/cnyxxCP8IkPcG1tFD6/L/oKh9gilTJtdToPE2EtefHbW1rRZoOYQg2
	 TGGLsEU2fwfhz761UnR/Umz18aP/6OuZ1ExOulxQNdpTWJGgeIZpKT2N3PUhuLLFoC3lW
	 LsiAoOhv1rkjAYlwePCfE1/uwRJZr9dTsTi7QmCnDm+cP4++b/Axz4pWrSpB7rX2Puexu
	 iTGjN1AGITUZ0GFMkwxZklTOtqdFv4KAI9SJf4cB6dNddzNFR4RC/ivkntlaSZLPHTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/nBU7ma";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F05606A33B;
	Wed, 18 Nov 2026 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/nBU7ma
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CCC1F000C9;
	Wed, 18 Nov 2026 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003936;
	bh=oR61j/RwbE31oCS4FJwAhnq3EM3gTMbsa537zhrbpaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O/nBU7mafUDe0VX11WMEbNOT4yaHqcx5b6GJms9UHZ/UqH0ZL0MuIzy1zftGV64tt
	 4HSGtO2Hqqz0/vy580RRkgZITm+y+KzDONAjbvAOfgQ7atF67K96ytYYevCvthQN5w
	 5G/yq4sMVRgG42yaYmlwjo24j98ISRVh8tT7M8SUVklM2RPYuuEcrcF/P63bWxC8De
	 /oscA0i2+3ylW2JRq2GQARKOZX37zeKK+8nqwS5PfzqBQABotlhZe7898Yd4v0zK9u
	 +M7R64DdfKnqpQaK5HYpxr/6hmiR8fmkqI/MlRt0nPTvrrJmc2i/OEsmOXt1pm8Qzp
	 jEaFuBV3ofVGw==
From: Christian Brauner <brauner@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261103155447.534264-1-sashal@kernel.org>
References: <20261103155447.534264-1-sashal@kernel.org>
Subject: Re: [PATCH] selftests/pidfd: print time_t as long long
Message-Id: <20261118-rammen-langgehegter-obrigkeit-e885120c3df8@brauner>
Date: Wed, 18 Nov 2026 13:12:12 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-04696

On Tue, 03 Nov 2026 10:54:47 -0500, Sasha Levin wrote:
> On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
> 13, printing the time_t values with %lu warns:
> 
>   pidfd_test.c:523:50: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=]
> 
> Cast them to long long and print them with %lld.
> 
> [...]

Applied to the vfs-7.5.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.5.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.5.misc

[1/1] selftests/pidfd: print time_t as long long
      https://git.kernel.org/vfs/vfs/c/448c990ad379

