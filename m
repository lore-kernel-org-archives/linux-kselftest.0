Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825E43CF1FE;
	Wed, 15 Jul 2026 21:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784150925; cv=none; b=BnSrkJztLUnKtuP4q/Zqbga8HCrJh+EewuJ7ijCOJcI7KGBm4bNiAZHi2d/kZ+EFcMbNOMfnfjKF+Du4xhw6wMR9Z6Jfs/5x91rM+OM7VXLJO8TEMpvZdS/NwPTLliOY6quDH+BcIm5Plkm9xqrSsMSL4H86PI/0WFo0GkovqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784150925; c=relaxed/simple;
	bh=s3Ge4+fSFCDwtgFoKa8ImetG2itv/ZDt3XeSWSuI/Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HN/is+n5KoZTdqsSUsfhWZKZpPY4Wf2okN/1Ey0zxoEey2SDSPsQwx9d+nfOVjO/otljs1Pf5LHA0vxhlzUc74lkPyUHAWeZ5xyyzyRDz8xe5U2aK+25g4I/7ep2IK/y+pM06mW5ih8nYa87uuxUmyNUWWsxWsxHy0IWAhrMQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNzy/ypj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNzy/ypj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679C81F000E9;
	Wed, 15 Jul 2026 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784150924;
	bh=shaHQ4Lz/IBXQgGLMQHW0qqVCSHZvCrD9EU2rqp1+t4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DNzy/ypjuooC/fSIYQfKn1PDOjjnJ7+Mqz3fnbqeHq0mJ0rkwr0tlv9t/4PX5Wj4s
	 esWIt3wuzSuok/NXiSaDuqf9Qj+lsgJlWG46ykdzAD+a0M+Rt3faK9mYmupCnqDmWU
	 dSx7WBK4kSL0VQ4S63XKMJR/sHTzdSifWeLJE+dbke9xd9sgp6/EbHmhiNN42pazNC
	 Z84UE/u8fu2fY0IOYNbrrrdgVf7rDN3hxNg4jtLpQSHp9uwJ3y5n8A1soksA6zFqdw
	 k9zXUAVyaxqCjCkftA7vOw4NQfQpzKKMSSVG4b11Iy82Di55SvL4bkjzxuf4KxDbGo
	 0wEnJTivqqEng==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/5] software node: provide support for fw_devlink
Date: Wed, 15 Jul 2026 23:28:30 +0200
Message-ID: <20260715212830.3077100-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 13:14:43 +0200, Bartosz Golaszewski wrote:
> [PATCH v4 0/5] software node: provide support for fw_devlink

Applied, thanks!

  Branch: topic/swnode
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/5] kunit: provide a set of fwnode-oriented helpers
      commit: 9fdbdb528488
[2/5] software node: add fw_devlink support
      commit: 37e586675993
[3/5] software node: add kunit tests for fw_devlink support
      commit: eecba5978729
[4/5] MAINTAINERS: add myself as reviewer of software node support
      commit: 122630406245

The patches are in the topic/swnode topic branch and will be merged into the
corresponding target branch soon.
