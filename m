Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208486329;
	Wed, 23 Sep 2026 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122613; cv=none; b=FTQ5CeJaJZ49wYwX7AiEchQe0wOqyJPMV5YC0gMRZmfN7chLa7qY5ML3aOo9MYp4w8Otks9itaoc7Rptcfpz5G7k+sUaaS5F4MTp5h4L7SSRUOw2Qro48vnEx2KWvVnPdamJ1CXk3HPiS0BONQP3Lm7LlKqY464a5ouJAAf3aoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122613; c=relaxed/simple;
	bh=PdJN38GtvBaVmtStM49iEIerdNIoUBgoWJhVeW1wEg8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CaQCamHQqGZ9pYMYMP/Yl3lQJ99HA7WpUuRYhFhz/VcuGNuMBdO9w+NmV74P684xHsEwuhjI3nqjhFV+conjPeDzuQ9o2pRFIqOiZB3v0KehGjmiMHTJGHH0Z+OwO/Nf6DnGfzCHyH8KGi2GwqJGPih8O/Dq5K4bZcee3PQzzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkcEgQuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkcEgQuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392E21F000FF;
	Wed, 23 Sep 2026 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122611;
	bh=PdJN38GtvBaVmtStM49iEIerdNIoUBgoWJhVeW1wEg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bkcEgQuLL16y8QC+0gdllTUn7AybM41Cii1cv/CnUKbr9A1UJuGfivJlOU8FECVkN
	 q1j+nmZX2WTE5gXko0K3x/0C5OWrwzAfaxc4mYHRzNDhd7nEjMTnUpeiU2sAJ8NKDL
	 qeLgCfywgLEZoJLoxFEJ/xiN+n8jZUMbOguDhySCHgRCzgN4mAAvSIafR6UPy3sLX+
	 B4nU4jDD0CAKXD0jyUODimfhEGKiwCxLV/L5F9qW0sIdEnXXKdBn2p8OXgFZ0tEG3v
	 KdXEx0GYxYEUyh9s+OYr2R5G1J0zR6ZSdn2CfNsbNoQ+8xbdnDxDAHja6xBOpaq444
	 3M4f6BayQs7tQ==
Date: Tue, 22 Sep 2026 17:16:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Austin, Alex (DCCG)" <alex.austin@amd.com>
Cc: Konstantin Sinyuk <ksinyuk@kernel.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pieter.jansen-van-vuuren@amd.com, "Lucero
 Palau, Alejandro" <alejandro.lucero-palau@amd.com>
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260922171650.1003abc2@kernel.org>
In-Reply-To: <21f4b63b-1aed-47ca-a766-dcce8fe55203@amd.com>
References: <cover.1787552412.git.ksinyuk@kernel.org>
	<21f4b63b-1aed-47ca-a766-dcce8fe55203@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sep 2026 17:24:01 +0100 Austin, Alex (DCCG) wrote:
> Sorry for jumping in late to this discussion. We have hardware that uses
> UALoE (https://www.amd.com/en/products/rackscale-solutions/helios.html).
> The suggestion from Jason is sensible: a new subsystem for fabrics and
> reuse ethernet stuff from networking subsystem where possible. We would
> like to continue discussing this -=C2=A0 Alejandro and I will be attending
> Plumbers virtually.

Please don't "reuse" any networking subsystem code without an ack from
a networking maintainers.
