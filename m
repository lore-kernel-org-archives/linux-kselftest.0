Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87A33A033
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697410; cv=none; b=UIVeXBu3GG5x5n9LNL6DFp3Ivk2ROwOLftgJWIW2i81H5QciaRnzfD+bOKdWa1naZndHBywoaiOX12au3ojk17AGkkBlz7cWdAEoqt7FSg1KEE0oWED0TNxSFxFZlCi5M7pj38xxOwYQaY0P/Aq7cyg0LvttO6mokvmw4UJ4mx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697410; c=relaxed/simple;
	bh=mz/EuY8jC9ieYjTjT8XfZfn15rgLMQGbwpMFMcAlAtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck69916THGmnGRsIdLulDWyMe2+W6m88EPJkRn64EXYFb5z+2W+63GcXTm9np/kc7/dwjgnDzt9/cPsQVoV5x8cETE2voDUud3zxc8vkH0FCjKti6E7vjQ4drGa65rDC/qvTscyzO6oe5ZJQdpl/1P7ORhJ2lXJ/WzeSr5moO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=e7ohBO2E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="e7ohBO2E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483bd7354efso102108695e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 23:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772697405; x=1773302205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5kaz3yDs+eQ3DSayWibzk/nqIRQjOvr8dHk2wAo4yE=;
        b=e7ohBO2EoHi9AUF1ByScMnNHk8aK8R7h37+EEg+EYAw2pTDLpwa5qXzI+XjgNZo5vW
         oCN1/FzT1+P5/bEe7/Rqk8NG6GKlhnGhaT+nT2Ximp2Rw5ehAVs6hNczVJzJhbK2UtKe
         VI/HJ3lzX4G/eM+cddPwkrNT9rtIdF+zZ9pXL0bMGp8173Sv3Zj4q+Yv6eEmu83ZSdJo
         EV/RooVcqE3OT0Ukd8LBHzI3glJnZ6J8qJ2R3tkyHipozJmpCqUTeHxq0jMbXJApxUii
         PNduuJAC9gOQ39xvHQTBgvigVuRqa0FrqTf3Qqjp8Hqm86PxWxpIpNC7B2tac5WcXUGM
         QRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697405; x=1773302205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5kaz3yDs+eQ3DSayWibzk/nqIRQjOvr8dHk2wAo4yE=;
        b=QqT8NKj1MkQyWpjBTGUS1LWrQ9MM5h1hW+ahdHL7RK6jI3fUhWO1QJWTQHgVt0Kuj9
         K/N+VbpwOfWFu7tY744hGTd4gi46Ew91D9LXcZKQrA4XMd/+BUKS/3hCbhfZBxLkGIC/
         8iEbrTrrYDnodCfG80EkZFPgoLGxvwCnEdLD5urVJTFX/kvTg94WdHI4GpSCzE2QvLcM
         KZ/zn9ZiwkjjmSSQ3kq4D7YqrTGpVphpre0k0NcFpPltNircewmzlaNAuMPXTeaueLMI
         64h6djnHbOl3ogMJ9zbQs9cg7PQ+PxacPH3KSMZLDWgsN7NsKU//MDho5DslC9YjTNpn
         jIHw==
X-Forwarded-Encrypted: i=1; AJvYcCXh8TiU0rivcBs4VfDZKC7JCgsnLjBydWDhe0qd3wu++Kg7E5/1QBdq7uKk8JhCvouk1m5Dfu3ZRQAOnQjzUBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqmZI5uHv7uOp2Q1SgXntBdKhpFroMW5jw5qlAJN/97n931DQV
	2rHNZPbCy4A3rJgOEJ3D64ILfHGu2TNW1DEBm9QK0qUinn0zY4Z/bUD0NhhOHfDKFkQ=
X-Gm-Gg: ATEYQzz/Kyqx8mNEG9oKeD1d1/tK4813S3fKbVd1LNmYLLnysmZZ1Hpeb/bNnl98pVQ
	sXmXAwjI++mmGCPGim/WBWOPY6Bgicdrhm7ihgnWwNlDLj9azeBWTwwjWUNi/7vV1WNqpmhBm6q
	IdkbdSTohWBw1ZBAjXs4mKyhlAGxqn6durxv12Ho2fql42rRrUsYRvIfQkjqebru99u8cQ1y26/
	wgJFj/QwDpgnzltzBd9SyxIZFzIRIKc8Pbr//h2cM/5qClmMpZLIgRfskAgyA3A9kbKt/Xb2Xlo
	KPbTKmSNa+67bwGtqWvthknQ66Z6Cre/7eHmSaEGD/WJyQ/EmnqshH3lo2g763EPXr6b6HATyOJ
	i2qlRGxcNY0ouFo2JTrEwg6+7xE7RpQb1RaYVkzvXWNAYVb26Wb1HgQYxPe2P/POj2vf9cNp1Uv
	2GIKniSjoNF8Uq+f93Ta/TZCGsUOG+K8qSUeY=
X-Received: by 2002:a05:600c:a51:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-48519886ca3mr85966475e9.21.1772697404947;
        Wed, 04 Mar 2026 23:56:44 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acfbd1bsm42090985e9.6.2026.03.04.23.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 23:56:44 -0800 (PST)
Date: Thu, 5 Mar 2026 08:56:42 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Shay Drory <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next V3 00/10] devlink: add per-port resource support
Message-ID: <np44uzfn6jea56uht4yq4te5clapgj7pk6ygyvkl22wxumwnvt@nrpvzjqzxenq>
References: <20260226221916.1800227-1-tariqt@nvidia.com>
 <20260302192640.49af074f@kernel.org>
 <pmxkihhtsskkwsvdia4z2ss4wxpfc4a4kqxkjv5wk3mwdmpzii@6go7pizk2nst>
 <jssifysprwuafkinc3dguspngxmplrngqxvotp76vhvu4e5lp6@e7mdrjqc5rme>
 <20260304101522.09da1f58@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304101522.09da1f58@kernel.org>

Wed, Mar 04, 2026 at 07:15:22PM +0100, kuba@kernel.org wrote:
>On Wed, 4 Mar 2026 11:34:13 +0100 Jiri Pirko wrote:
>> >>I have a strong suspicion that the user will want to access all
>> >>resources of a device. `devlink resource show [$dev]` should dump 
>> >>all resources devlink knows about, including port ones.
>> >>
>> >>What's the reason for the new command?  
>> >
>> >You are right, one cmd would do. Good thing someone forgot to implement
>> >dump for it :)  
>> 
>> On a second thought, if we merge multiple objects into one dump, how
>> does this extend? I mean, the userspace has to check there are no extra
>> attributes, as they may be used as a handle to another new object
>> introduced in the future... Idk, it's a bit odd.
>
>That's true, the user space must be able to interpret the object
>identifier. So if we extend the command to add more identifiers
>we will have to add the bitmask to the dump request, and have
>the user space tell the kernel which objects it can recognize.
>I was just saying that we don't have to add such attribute now,
>maybe leave a comment in a strategic place for our future selves?

Or, alternatively, we can have per-object dumps as we have for all
objects and command right now and leave things simple and
straightforward? I mean, I don't really see a benefit of a single dump
for more objects :/
