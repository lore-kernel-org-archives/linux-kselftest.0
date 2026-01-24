Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F1010F1;
	Sat, 24 Jan 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769281714; cv=none; b=Eb3xl+J78Hbt04apTnXyD2tq/2BPPDNYQYOj9Qkyq+36I47WNQrR9tnaVH0o+Ic80sgVQ3yUJEDKfpR3G7bBMZHPWJzjEXkGJ8J+4dRFUqEO/ajSnQaMR1sdGUk8OROhhvcwXaw5HpgP6seJgJs6cio9VsWgIPVtktIiOdHq+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769281714; c=relaxed/simple;
	bh=HHqI/5YbdiaKY3zYiZAjqyJEUJpaRjXpBKsAKquDRoY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fpKpbtf4pUqQ6ID7SOGPGsFZKsRZ3nj9G0unwTswgCunvDrTQdsJ2mPzxmCf/w3683NknE5O2XVnJ7RFuxkW4ZGZJMcqERcHKv8EQE/0ZS2BZ0W8bZAV9oA77MWBeszMNbMzXBFHM99nJ7FlnfKXl6CJ0bG63t45jXd+H4jMP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCHAQLng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCHAQLng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1957C116D0;
	Sat, 24 Jan 2026 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769281713;
	bh=HHqI/5YbdiaKY3zYiZAjqyJEUJpaRjXpBKsAKquDRoY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QCHAQLngdphPG3mbYtbCF9ocg9ea6hBIDHR+eg3QMkWHRR4l6vEBLC+eoe/dnIpBn
	 5/qZDOy99fANKV5TGFJYdD9kAwIy7Q0wQ9ANkwQwyPKM0k62tyTXWadvV7V9bLuy7G
	 Q/zijughaULrndbJ0uQxGwaXWwesHKbniVDgpPQa94TC7bzsVGOV83hP+jazePIlaV
	 WBoXrLEMBP5jJoc2e9CR5AqHsiYHGdGN2Ko/3QE103xNJMjqkDWDLabxoLMmQpabp9
	 N1/adfqQuhiPzOUXnKI95+n3xosTbVeZL5looqoRaqc3f7hs78mP9EtCIGY6IFpEVA
	 3ilsb4VAGhPZg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 20:08:28 +0100
Message-Id: <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>

On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> this does not look like the right interface for the chardev unplug issue.

I think it depends, we should do everything to prevent having the issue in =
the
first place, e.g. ensure that we synchronize the unplug properly on device
driver unbind.

Sometimes, however, this isn't possible; this is where a revocable mechanis=
m can
come in handy to prevent UAF of device resources -- DRM is a good example f=
or
this.

But to be fair, I also want to point out that there is a quite significant
difference regarding the usefulness of the revocable concept in C compared =
to in
Rust due to language capabilities.
