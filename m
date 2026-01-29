Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E514E2F2;
	Thu, 29 Jan 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698915; cv=none; b=P0DMYraQSmwiZw0KPpy/jRpD0XiJqDzFOtfo08oaKY7kZmJo/SJAXg3/5iAM+SF3xAFxdZwi88d+2p2eM1hE7JZ4pkqmxcYrLXL7NbZ1ATjUk5NbgIdrC0zRvN2vWxwdRvTnFM62i1cLJRZBEo0MrN9P+/+f/6kwW10iR8lc/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698915; c=relaxed/simple;
	bh=PRJ6WbfIsCqwl3PRDJG2raCmc16x8QC0hsryes2DrSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTTjfjps0FcxMi1rurm3TNKvTMsrDPmdTbGOjOabQgUO2XFp6TXYrwT8MBIeujzWR7ZE9HehZCIrZA7B90B/M/aqyRSXNpTkMeNE83TTtRxLNkEzkEQ4lRL+nEEgyDeUNgXO1Q4CA4O4UO+E/T7nEOnp5zP/f3HAMNe9VmhuwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCkgdW77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCkgdW77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5020C4CEF7;
	Thu, 29 Jan 2026 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769698915;
	bh=PRJ6WbfIsCqwl3PRDJG2raCmc16x8QC0hsryes2DrSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCkgdW77AzJl03Q3NZu0CslWlULIihabEZoLCDiFwjgGMGwAh1xz3aH75XT9H0wXe
	 R7pjPPLgXa5v/yLxIzRBYqtJ3CaTuOnjp4q2f3tvVcWjk30AA8BTpXZPAqHIPnY5q/
	 5TFYSFTHtYYM+H8a63vZJUt3eWDYu705k6AeuXoHAH7m1VQJO4ndlS0aG5O+21zYq+
	 uN7KUNITsoFhXINDeE+KglgV/bSP4268Cjb7LV00rQjBNk1g5tYrlUUBoUFBQmH7Wv
	 PwIzvBlLrLowhFLYFwpjp+CxrORi6MW3/7+UlpXuE5+/8Qq4fCo4NxjWFvdAt6NKuN
	 zbgQZjpahz5QQ==
Date: Thu, 29 Jan 2026 15:01:50 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXt2XqRnBjb25f81@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <aXjgeNY-jf9rIw09@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjgeNY-jf9rIw09@google.com>

On Tue, Jan 27, 2026 at 03:57:44PM +0000, Tzung-Bi Shih wrote:
> On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> > Turns out there are correctness issues with both the gpiolib conversion and
> > the revocable design itself that can lead to use-after-free and hung tasks (see
> > [1] and patch 3/3).
> [...]
> > Revert the revocable implementation until a redesign has been proposed and
> > evaluated properly.
> 
> I'll work on addressing the discovered issues and send follow-up fixes.  I
> believe keeping the current series in linux-next would be beneficial, as it
> allows for easier testing and wider evaluation by others, rather than
> reverting at this stage.

FWIW: https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org/
and https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.org/
are the proposed fixes.
