Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809B499F24;
	Thu, 13 Aug 2026 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640759; cv=none; b=mYjMr/n2K7+Ct6xr1kp8ygAYxN4OkKSoZLv9FwfJ3+dpnT/g3RsEVrs4V1vare+5or3YlF0uP9wMiDkPu1UnMrMBdbwM5EcTcv1cNiXFlmRstk0tnEn3XbYTfoeJdHQw5j+gMPTvccW3LYdMlan/f8AFJY3if9CYjmea+R1c390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640759; c=relaxed/simple;
	bh=/h6Iq0inS+AwrrSVQR2zj2wicIPfSR0HLOnCyN70iOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxXSKveMDoSHg668q4S0xK9qfiPZyDBfhNC8kXhbXlvnEMOu3rU3PsDQ0WvPDgb1w/StFGi9X33F6C4vc1B/I09WKsTOxIDv5nUl1D3mfGrVWbp/yQNudZeGBCvpYa/3eKqu2lexQY+x29rCZIEOBIvL4dyP6RuKl1vrZOQZbNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPdVXuUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPdVXuUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EDC1F000E9;
	Thu, 13 Aug 2026 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640758;
	bh=/h6Iq0inS+AwrrSVQR2zj2wicIPfSR0HLOnCyN70iOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPdVXuUL7CNicaO9tDK29n2+Vok9ETu+USBFzNcIZqj/OX6McK81+T7NymCeAitmN
	 XNwvqfD/Mg94mhu0OgX+0AmW3jF5JsTWXg5fWadRN7slHvuH8ERMElC2Cic21kNFtA
	 uDudOQMoF/aRi/znng4bCc+IXKvSiA/E1Jz45iXiaUCR6sG24KBI5ZG44skVEFf3FJ
	 D9wGUORoA7rzLAyg/P8+1YuAX+2k8tXTpYgBfn/3He9APxjUaHJMP/SLphWPGpLmon
	 F8GE6nbFrvOLYNXamEJ1YIC9aAMygA4ciOKGpYA5vjqT59I2jXuHxFDB9RoIBoR1HA
	 SmJCES7UOfM9Q==
Date: Thu, 13 Aug 2026 18:05:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Message-ID: <20260813-mold-fresh-29e1760a301a@spud>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NXgwmi4Kg0m2Fg8J"
Content-Disposition: inline
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>

--NXgwmi4Kg0m2Fg8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NXgwmi4Kg0m2Fg8J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan35cAAKCRB4tDGHoIJi
0nK4AP9ZcJeR028IZ2nwcQdJmTyUhrGn5cq8v2TxJ9nGfTUnYAD+I2lnjEePX8Jr
0aIDUkcEgjysaF6bMW02XACuofwD3QU=
=FXzw
-----END PGP SIGNATURE-----

--NXgwmi4Kg0m2Fg8J--
