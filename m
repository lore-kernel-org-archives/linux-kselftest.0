Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2AA2D73A0;
	Fri, 25 Sep 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363417; cv=none; b=KAdJbr5GehY8YpAX4UFIUzmjMMvqqPQ3xFPspNAb8dUpmoHjvSxV6EvzRyhHDOnMbawibF3YmAWDK/D5shZDJDL1Eeuliotj8KwnDmHY/LETTIAPap+Qe8utgdetzyBioZz/xFVtb/qCbS2P4L6Z1DEptjDZnb+l/14+St+5dEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363417; c=relaxed/simple;
	bh=zPE7Fpdceg+qVWrlR6SfURBbX130IhK2/zfJ968obXE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4+IEPSCYyVqYw/fuwHWQjWhSoG/4DnOUmmFIM6r0xMMODtAZprQ0sCtZddz35PtMPNjsBrJX0uWde7fFV/sz31CyQPCDJSWtAyx75ffPzQmzXEs3T6QRhZlNybJvIs036WcOtairOCGdlbw94toeu+niwmAuK6bW4ww6cQ3GrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lta26CTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lta26CTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C64E1F000FF;
	Fri, 25 Sep 2026 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363416;
	bh=WIh5MF91TgNDRmG6Qisl3WLz2tFz4iMG+XOqdmL7CGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lta26CTJTzuqDDh5KI8mVWRhpEM81U1UcckDr7elT2XmDDv9u3Yu83P5Kh49UB1d7
	 3RmumOK4R51exJOZZNWGrKtF5MQN87aNO+1fQdjMPzcQisfnSm1Sv3mQpPjr5nVKML
	 ClXq0r1H+aVB7Wb5sxjDOFcwtAuh3SeOaFRNklbtdCY2DF5NQOUE8Q4alUJYQJ7BjU
	 0WLKQ8Gl14aZLEKpS81xG/puqobi7SQ6pP3/HchhrBK1Sd4KV9rXlWut9JVd7yL2qs
	 c3EtSA68/rbFVVNiAjBjoowFqz46o784ouT6Tas+VISMbCw56jRrP+LfDzqv2gbI6h
	 4Y8PV2u15/CsQ==
Date: Fri, 25 Sep 2026 12:10:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Konstantin Sinyuk <ksinyuk@kernel.org>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260925121015.08b8cc15@kernel.org>
In-Reply-To: <ara5iTl7bmgWbPW9@intel.com>
References: <cover.1787552412.git.ksinyuk@kernel.org>
	<20260921131911.532d81f4@kernel.org>
	<ara5iTl7bmgWbPW9@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 14:12:25 -0400 Rodrigo Vivi wrote:
> I do understand the feeling here :(
> 
> But I do hope that you reconsider your position here. We had such a great
> experience with the drm-ras using the netlink and I was really hoping that
> we could just reproduce the same experience here.
> 
> Netlink is such an incredible API.
> 
> Would it help if I take the maintainership of this drm-fabric netlink
> along with the drm-ras one, ensuring the same consistent and clean usage?

Hard call, I have nothing to complain about with the drm-ras work.
Purely worried about the time :( Well, that, and DRMs general love
of Rust which seems to be about 10x less development efficient for us..

Let's start by feeding this + the spec into your LLM
https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/netlink.md
