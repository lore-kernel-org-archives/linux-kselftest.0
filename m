Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C143D47A8;
	Mon, 11 May 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508028; cv=none; b=hUz/0DTsZ0225XeoxAeebV2ZqIZD5Bs897j38MCoOAOIUxueKm/nQhay+K+MnVGFw+UH8Vetq4nmlxTAYkeghnTlKLsjNqwyOQSrYMj7+ELODw6EsANsWD4MH/Ggd7vlp9ZwEwQo9eJTYMg8v4OTrHjFWsZNt2hKNstsbwfAy4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508028; c=relaxed/simple;
	bh=h8VUfbpIL9o8+z6jI9oS9AuzjCk9qzd8Edn6MeNhtiI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Dcspmf0yQFt4y90T7VST2QwJ0P89AQJXJGyhCSy3pIGcODDpMxwRRbWtyTxLIe1nfrjeuZgN50q7nd+dOq9oCK+Bv1etMFMmhIVytW8GnTDoZbkJs69eD2tJf5YlnJnnYS7AMAR8poB0pJiVRxD2VJnZpTfq1jsCp1BUNryqfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjlFbHKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjlFbHKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A81C2BCB0;
	Mon, 11 May 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778508028;
	bh=h8VUfbpIL9o8+z6jI9oS9AuzjCk9qzd8Edn6MeNhtiI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BjlFbHKDuTpKxbjjTVs2l9DgSsZoZgqn4o/YW1nRsNJ4Pb6i2K5C/WfZJUuFkMi5S
	 hI5QAji+C4VBkb7Cy/u7YFcJ/POIp8Bx6ZXkz0TxDEg73HkDYcA6XUkIlNKXb1VN3O
	 RdwdnP11D8SJZ+6Odq2ipunt44QS5Co6sFIwkoGHMUHq4HfszTu7HLEwjnVH5Ujbe8
	 bgXvLJixlME8xKz8N1ZjlKBKiBPt95U7tanEAn2Mwd2sjEJ5XcsIOxFWg9Oy2H9JqF
	 EVycfX7pd+bx/QdnJBgTlfaN/AZMtX55BStqAb2/6THiovljLtDQXRT351d4yVvl+q
	 RxbIhOElljz4A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 16:00:23 +0200
Message-Id: <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on
 release()
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Rae Moar"
 <raemoar63@gmail.com>, "Andy Shevchenko" <andy@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com> <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com> <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com> <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com>

On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
> Danilo: if there are no further comments, can you pick it up for v7.1?

It seems that sashiko has a valid concern in [1]; can you confirm?

[1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-unreg-v4-0=
-01574da0aed3%40oss.qualcomm.com
