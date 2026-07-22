Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1E3F9FB;
	Wed, 22 Jul 2026 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748869; cv=none; b=ZXv/TxMbika9cgDWkPiCso9eq0iIW1YYHeK1VI6oW9tC9shvSfGi+L6kJACbODoQn8PY1LsAaA/FPWpZTllPlkFBNZzaTRfJFHJ9E0dVydlMSlGpMsyyct6pUYOsgrUFlLEKj2pxYvnYBd+jvK4YS14k1wKsAWBPxeWhVs0gwy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748869; c=relaxed/simple;
	bh=0K/pYqUnKFuOeDxf9/ic35vUuU6oh1QGd2fHyoWdOwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0CWn3BfkL8AGmCSzYPCBdf/6I62my50jmuLAlJLRrHzDhtcJlAT5JuNZXxanaSKWT8NZfX9/Y33/78IWP4PjVLB19sI7WM3x0GqtmmPHaCt5so18PK4/bJUqxWcim7Yr218NdwaC+Hat87uwws+Lb23hv+4IiifOQknJT6wzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEOoenwe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEOoenwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B3D1F000E9;
	Wed, 22 Jul 2026 19:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748857;
	bh=uP2dCK26+PgyvE2RhXRoVPEhJe/1Dl+rLykzvE/LRyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EEOoenwe8XOorjHFKQL4kDq/n+JhOASyHDvaZkq3p90Hlbi4V9t+vxcmR9la31BYW
	 UjMmzbyuD8WyVcA20O0LPwhgjAMS5xk21s7MqEz0+cJ4SPGnlHeWT/MeTqn+1pEXmY
	 KpIN7gGAlZmJPprS6phn2reX67rcCoKgV5FE0wffG6tHT1e6PQW9ZgtaqowrYhej0Z
	 Oa8dyjGt5lx9xCFuDyqQ2wyX0HGAnVh87/KDCM+2aM1qmW6RY7Dj16lTa8bJN+Ywkx
	 OOh2/uMe6/c+A0oSeHd2+wOjXGqaNcdx0p8ESF21GxhG3W5KviHXdEZWr6PEnkyNAf
	 4bsY9oSRR48MQ==
Date: Wed, 22 Jul 2026 14:34:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	David Gow <david@davidgow.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kunit-dev@googlegroups.com, Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Pascal EBERHARD <pascal.eberhard@se.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Introduce nexus nodes
Message-ID: <178474885623.1540487.275130426002937669.robh@kernel.org>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>


On Fri, 17 Jul 2026 17:59:17 +0200, Miquel Raynal (Schneider Electric) wrote:
> Hardware containers can just decouple external resources like clock
> without any more control. Nexus nodes already exist for PWM and GPIOs,
> add a binding to allow them for clocks as well.
> 
> No examples are given, the file is litteraly a copy-paste from Hervé
> Codina's work on PWM Nexus nodes, hence we just point to the examples
> there which already illustrate very clearly the concept of the various
> properties.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../bindings/clock/clock-nexus-node.yaml           | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

