Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7830D41D;
	Fri, 17 Jul 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296202; cv=none; b=ld9Eoj3QXzzS1VBDNCQUeGJY2BVySs8Dtf6emnOTvSMo4lDdUqmtwhA/Tajo86W8aQDcS/DGPuJE4Lw1ydZpTr49DgEkxDLzRzQMz3VoFxtJhNTdlA/Drf4xjDUWkQx+c+j26RZ9GS49BSNhywGi3mQ6XHKyxyDstoj6ep/V0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296202; c=relaxed/simple;
	bh=kmDfF3yV5c+bsoLJV/of/MuvV5iPRqd3YMoF4otU7nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=VHdywwAPuZo6VQ8OvutIi+SmEWvbu3xQs1/+2U4a+3S1L1REYbaK5My6dFl59zLcleGQNcAHjoKYzzttZzD3OmvQw5mW21GGqOn0GeGK++D/aQslU6okiRQIZiSVNTv9txEsAduK4PBXF/yAWwRty8cPlQSw9kprfvRDOTl+aC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfZ3lCw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfZ3lCw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263A81F000E9;
	Fri, 17 Jul 2026 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296200;
	bh=P8RGWqk/z7JG1c6TNKuPoPbGcG6s/ejxJ/FFxp5MzYo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=BfZ3lCw5ruLutg6KfGd+nm23HG2177Bq80ZdVrnjOM3trOrI7mKdzj3Zx18fmEO0H
	 bQzbrNesDyjK8EO9Hh+IOS89vjUMG5bV9z2FQtIRNqAOpfjrwpWv3kSiF1mQY6194A
	 y0FkPlMGqn0XaHgo3psjDm3qf8ja7cLMbGYbQfyaFaV7WvewiNso/uOGAo9E/9z+Wa
	 jJ5CLrgci/Dgx8NIacXsFSSSxMKSUeNz/FPF2RE8mXujiv0X+ykdy+bR7mIoT4agCf
	 Pm0zB/ousu2YQOhQ3Fw17cx4791T9PkUL6yPHNYImnVVdvO05zYRx6ebatcCR7O9lj
	 irvm16DPyWt6g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 15:49:55 +0200
Message-Id: <DK0W7O5C7LYK.3BJOBTN337Q52@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: (subset) [PATCH v4 0/5] software node: provide support for
 fw_devlink
Cc: "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Rae Moar" <raemoar63@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Bartosz Golaszewski" <brgl@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <linux-acpi@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-gpio@vger.kernel.org>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
 <20260715212830.3077100-1-dakr@kernel.org>
 <DJZGR6NV2WK5.2ZRW7VZIRO3LD@kernel.org>
In-Reply-To: <DJZGR6NV2WK5.2ZRW7VZIRO3LD@kernel.org>

On Wed Jul 15, 2026 at 11:30 PM CEST, Danilo Krummrich wrote:
> On Wed Jul 15, 2026 at 11:28 PM CEST, Danilo Krummrich wrote:
>> On Mon, 13 Jul 2026 13:14:43 +0200, Bartosz Golaszewski wrote:
>>> [PATCH v4 0/5] software node: provide support for fw_devlink
>>
>> Applied, thanks!
>>
>>   Branch: topic/swnode
>>   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driv=
er-core.git
>>
>> [1/5] kunit: provide a set of fwnode-oriented helpers
>>       commit: 9fdbdb528488
>> [2/5] software node: add fw_devlink support
>>       commit: 37e586675993
>> [3/5] software node: add kunit tests for fw_devlink support
>>       commit: eecba5978729
>> [4/5] MAINTAINERS: add myself as reviewer of software node support
>>       commit: 122630406245
>>
>> The patches are in the topic/swnode topic branch and will be merged into=
 the
>> corresponding target branch soon.
>
> I will provide a signed tag once I have the 0-day result.

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
/tag/?h=3Dswnode-7.3-rc1

The changes are also in driver-core-next now, thanks!
