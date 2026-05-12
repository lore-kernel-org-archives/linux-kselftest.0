Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC81ACEDE;
	Tue, 12 May 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598447; cv=none; b=H5s6LJthIGBHKC7HHvJv7kL6TU00gSY1loLHJlg+UQrge3gabUNLJ6mXzSN+P9AxemPSEpp/4gB5dOMLakdSDLhfl0Fz97AY6Qo0IZNZLUAT9R+bWZMrRMmE3X/mvkGhAN0z2/6G9XiVjapThba0CnUclLIRSvrQAUxObrwd2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598447; c=relaxed/simple;
	bh=VGUGdM62zg1gAC6kZ0WEWMjSc3iUQoFTDxC1OOhBMYo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GN6XBuEr0VJFe50ffSkEV90bOTL85/rxxzqppe2iMJpAqhV/6PYzmgHphdjMJg0n+IFbCO3c5+MhTP5365g+cQLIp2W6n2EiDZHH/3oniLL/Fk6SM2vzOrHynsp7KcG9AN7e78+dfQxl09eWXFir5CVJodZ9lQkrCtRCGRIm4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgbdtI/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgbdtI/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B40C2BCB0;
	Tue, 12 May 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778598447;
	bh=VGUGdM62zg1gAC6kZ0WEWMjSc3iUQoFTDxC1OOhBMYo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=XgbdtI/9XlYUoCERPTGPOLo6a2fOk6ophOyBEVrFZxf4WZYquzfUQ7oRQVykX7zKQ
	 zQt4BdAbbIh+SnEs7BsgXrUJScqS3HmvlrC4NVpTFylYQlYLSHRN4FhkfhYMbeKbre
	 5lxd6ZFQbZcr7fuHZQJ+DSf2Kg2BaDM0eMTIrHJzkndU3DyTm9rzr2gq9pqQxCPwfB
	 DnmSNKvPl2gRYUi7kAVBV0s0nqm9K0ljV2AP/jacCdTa8f7z+/AcwZnaS3xWEMAQg/
	 nuS/50cBo01Pdg1VWxX8ws3mo6vRVwNy85+X6miuZczfFIi5zF1SEkk6uvdbuFQwRP
	 0lxILMQrG2pug==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 17:07:21 +0200
Message-Id: <DIGSJ00KYS92.1FC0JUD8FHRD1@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/7] driver core: remove software node from platform
 devices on device release
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Rae Moar" <raemoar63@gmail.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Maximilian Luz" <luzmaximilian@gmail.com>, "Hans de
 Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, <brgl@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>

On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> The first 5 patches are part of the fix and the remaining two add tests w=
hich
> can't really do harm.

I think we only need patch 1,3,4 as prerequisites to not introduce a regres=
sion
with the fix in patch 5. 2,6,7 can go through -next subsequently?
