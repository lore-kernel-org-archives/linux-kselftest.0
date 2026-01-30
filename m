Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54683559C3;
	Fri, 30 Jan 2026 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794883; cv=none; b=HNXkQmKgioXsHTBQJnzGGIM/2RfRFvHqitAD1GyepWsphqI3ivDtU6ImTNlkTXY//LRCbT1kwkoyV3oK4+NbBnjpnA4kMkdz5FdCfbqUUevLmnDmsL/qgeSsqi787rFpMvUMiOYo+qAgf3Iab5F6aA+L2/16h5XABm5gdqykm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794883; c=relaxed/simple;
	bh=/yDYVv/HLVixY2p0RO7gQXURbbrWkT6rJH2CWhjhsXY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Qoa5CRXkNHYtSyMaO8YqLs+cxBb6OnKwhs3jmKMZt/gL/dcrLYmcqu2Cp7b9Zvxqs2qFbdEY8/yhWidQUlKdaQFh6YepJCciQNpUfQgFZ7th2gXOPy+AZeMBH/1aqHuFY4s2Cd9xvCQruxp781kmT7pZs0iniSOMcLlV4dS64nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jS/qdE7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS/qdE7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520ECC4CEF7;
	Fri, 30 Jan 2026 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794883;
	bh=/yDYVv/HLVixY2p0RO7gQXURbbrWkT6rJH2CWhjhsXY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=jS/qdE7r+KH8/pi2caOBa7WnBDBDSk1PJ8W4S/7S9QX15+LiQYWJOM/BjHpYR35pm
	 hYesA3D+PTFnmwUqCplajw3/OMjL/Iz3REFPqMz21G3vekm0vFEabDsT3zkbvkJkke
	 U6Gof3aWNy5Va1Lj7Dr5zN/tq2R8ENj4i25LuoNBDZt/WFLg2fATZ7ii7lpexTMb1h
	 djN2aauLCWOygddFvNjUkAtPbXKFnuWQSrVyY3WVJHHJ5XIEjbAKDh9aTsYKSSFNse
	 3xWZDifXps3WXN2zGe9W1uIdJjx+pjoV5rzGnC3jz6HFlPNps+uLUbs1JEq2DWRlVl
	 S9iTbBggXlHwQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 18:41:18 +0100
Message-Id: <DG23XB4M0MLS.1ZHTFHJAUJSTH@kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Johan Hovold" <johan@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Dan Williams"
 <dan.j.williams@intel.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <aXjgeNY-jf9rIw09@google.com> <aXt2XqRnBjb25f81@google.com>
 <20260130091205.GI3374091@killaraus>
In-Reply-To: <20260130091205.GI3374091@killaraus>

On Fri Jan 30, 2026 at 10:12 AM CET, Laurent Pinchart wrote:
> On Thu, Jan 29, 2026 at 03:01:50PM +0000, Tzung-Bi Shih wrote:
>> FWIW: https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.=
org/
>> and https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.or=
g/
>> are the proposed fixes.
>
> I won't review that, sorry. As multiple people said in this mail thread,
> the API needs to go back to the design board.

Of course, you are entirely free to choose what you want to review, but I t=
hink
the justification you give is not entirely fair.

The patch series was on the list since August, you were explicitly Cc'd fro=
m the
get-go.

In v3 you said:

"To be clear, I'm not against the API being merged for the use cases that w=
ould
benefit from it, but I don't want to see drivers using it to protect from t=
he
cdev/unregistration race."

This was a reply to Bartosz saying:

"Yeah, I'm not against this going upstream. If more development is needed f=
or
this to be usable in other parts of the kernel, that can be done gradually.
Literally no subsystem ever was perfect on day 1."

Just to be clear, I'm not saying there are no issues to be addressed. And I=
'm
also not saying that you never raised concerns, you clearly did.

But, given the above, I don't think it's fair to request a revert as a
precondition to give constructive feedback for improvements and fixes.

- Danilo

Link: https://lore.kernel.org/chrome-platform/20250912145416.GL31682@pendra=
gon.ideasonboard.com/
