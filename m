Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26B313545;
	Fri, 30 Jan 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764330; cv=none; b=DdryTT3M6mBYlmZsYfIkUnPiVwn1TjQ3weTRK60/mdtuzh0xADPC44F/vS9gbzn/KO59I17Qop4eZShshnU3P69p6m0/Mhf1ik7tE+aBQnD2pNJGQ9MVxcLt60mS3EGxWLAu6B2uZ1+uTF5DtFmZx3YSuzFZym11P4c/IncQl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764330; c=relaxed/simple;
	bh=zSkklyuLE8HkmKOM+X8WC6cl4Z5Dw4K6neglavCVEfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npB+HFVzo64LnQZtIW3fVpP4QCWSVFyX9yoWg7FY2uYECQQrRDjUQWlDT7bg1BUsPPZNoZg0Ilw6k/Yy4AcE62txRrRWiSwX5+fjmf0pFQW6Ke8wjCRXcaY5TNGVi2+9FaMC4lQk8dNvtrd6NoP9fk2+jOdK5ZuvY88A53+35qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I4Wj1v6i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I4Wj1v6i"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9A1B03A2;
	Fri, 30 Jan 2026 10:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769764288;
	bh=zSkklyuLE8HkmKOM+X8WC6cl4Z5Dw4K6neglavCVEfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4Wj1v6ix1bkop733M4hhsYMnKkCxOJz/hsN33vDYYU7rgHfHp1SM7hB3t35VxzPh
	 0g0NxSmSCaf/6bcrKizpQxQZUczhqHlJyWxopSKhOSg9Y2B8/065asunBdOFOaGyp1
	 BXI0c39mslh6Hn/vIbzC8M4LXgz+DI1eSwo0VKcM=
Date: Fri, 30 Jan 2026 11:12:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260130091205.GI3374091@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <aXjgeNY-jf9rIw09@google.com>
 <aXt2XqRnBjb25f81@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXt2XqRnBjb25f81@google.com>

On Thu, Jan 29, 2026 at 03:01:50PM +0000, Tzung-Bi Shih wrote:
> On Tue, Jan 27, 2026 at 03:57:44PM +0000, Tzung-Bi Shih wrote:
> > On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> > > Turns out there are correctness issues with both the gpiolib conversion and
> > > the revocable design itself that can lead to use-after-free and hung tasks (see
> > > [1] and patch 3/3).
> > [...]
> > > Revert the revocable implementation until a redesign has been proposed and
> > > evaluated properly.
> > 
> > I'll work on addressing the discovered issues and send follow-up fixes.  I
> > believe keeping the current series in linux-next would be beneficial, as it
> > allows for easier testing and wider evaluation by others, rather than
> > reverting at this stage.
> 
> FWIW: https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org/
> and https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.org/
> are the proposed fixes.

I won't review that, sorry. As multiple people said in this mail thread,
the API needs to go back to the design board.

-- 
Regards,

Laurent Pinchart
