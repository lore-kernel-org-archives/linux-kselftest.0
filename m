Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCEF1F9F70;
	Thu, 29 Jan 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697481; cv=none; b=gF62BlEvEKQcj9BeY+A+zj/zJqw4xRgEZ5rv2Jl2O8XeffCX3FWiuwiHHzzpkX8cyEZrqybrGK2fmlcbLcvlZPSyPj6WmFOnVFj1ChG/VHi+DVevBz46L1rE/sMCAF8f/JvGZrCm6GQUP2pH+X0aW+4xoJMFy5fhiflwnGV90ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697481; c=relaxed/simple;
	bh=tA0/tKBP5YaZ+snLYY6z11qxzqXuPDAguEDSAU6EZCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXowpjhjfNZToGuwpXtsdkvU1xcl4e4NwZRVmEv8rJ1t+TYhBZcH6aLpzHgdQk8AKeUd5cHi0i/KBasQ2jSVuED58AMLlpdEk4em8qY7lUvtrzQqmR1GMDiBDbHZHxtccpfCp4lL/QCvn4C6+7PLVvus/wlzZLh+Ngo6AWUxNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pnku8vWP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pnku8vWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200ECC4CEF7;
	Thu, 29 Jan 2026 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697481;
	bh=tA0/tKBP5YaZ+snLYY6z11qxzqXuPDAguEDSAU6EZCU=;
	h=From:To:Cc:Subject:Date:From;
	b=Pnku8vWPJLvVpPF/NsuMZ0Lgw/XCjU0PH1giqx6LbithD8uYa0uFl9X6ySOsJOLKz
	 FhxyLTMOCcXbpMPimoxwCeQGL08WHEP6AdlZkrsqfaJ2PTXWq2ElPrgMIw5VqLmA1+
	 ePZk95J5f38VlzmucJpqonB8JmfMqzosuRxXUj8T2E0HeTbspEoyODaFjc6C80KxDI
	 2R+uD9MxBNbn/CujiozKKDCtCgeE533z6OvWztKv8k4p9GVtFbT665HxKMQVeh4fts
	 Rdg+QeDoQEPC5COJRFkO759gBNZOy1H6BP66vnywNhfARba+1O+RH0V70wHRKIaVvU
	 5SnyzavKMmg4w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH 0/4] revocable: Fix reported race conditions
Date: Thu, 29 Jan 2026 14:37:29 +0000
Message-ID: <20260129143733.45618-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 1st patch fixes the issue reported in [1].  The 2nd patch adds KUnit
test for the cases.

The 3rd patch fixes the issue reported in [2].  The 4th patch adds KUnit
test for one of the cases.

[1] https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/
[2] https://lore.kernel.org/all/20260124170535.11756-4-johan@kernel.org/

Tzung-Bi Shih (4):
  revocable: Fix races in revocable_alloc() using RCU
  revocable: Add KUnit test for provider lifetime races
  revocable: fix SRCU index corruption by requiring caller-provided
    storage
  revocable: Add KUnit test for concurrent access

 .../driver-api/driver-model/revocable.rst     |  17 +-
 drivers/base/revocable.c                      | 118 +++++-----
 drivers/base/revocable_test.c                 | 216 +++++++++++++++---
 include/linux/revocable.h                     |  60 +++--
 .../revocable/test_modules/revocable_test.c   |  54 ++---
 5 files changed, 300 insertions(+), 165 deletions(-)

-- 
2.53.0.rc1.217.geba53bf80e-goog

