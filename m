Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D58225A2BB;
	Thu, 14 May 2026 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778718250; cv=none; b=Y6ma0E08rFaQJMnctLHDS6ZhCn9S9TQdmVkVW1MveLWZRBIv1mGtbhFTaIcFSQsQPyBd/1nPp2iCuPf1QSvAJLN8Fy/gpsJQByLW9Bq4FLeJzoF74eVnGhhz/cCanEI9p041jwDvGm5JD5tTQKBkC/cdOvW5zPm4EvSxd/uAvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778718250; c=relaxed/simple;
	bh=NqTvVIlot6Nb0r8ZPjLmjRZqNKYxl16s8XgEe0ozoIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTbqv4Ha56X6w0ieGX1kFC1qt4fkqTek+cJer0Rse4uMpVWfvPgSp2NoDciPPlAdgfQSD+i0Rgn8Y5yAfi1QlaIzgwOK1oD7fLNG15SRqpiKmmNKr3572FWZjXZpDiFimnQIsrgKpL0yZLAGPbSVRPh99la+adRkLEpAk0y85c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9vSb8xJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9vSb8xJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF790C19425;
	Thu, 14 May 2026 00:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778718250;
	bh=NqTvVIlot6Nb0r8ZPjLmjRZqNKYxl16s8XgEe0ozoIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D9vSb8xJYf/Q/rPGAK1bR24UGmaQuaeMybhf4c50GuGLwAjx1Bdwwhn6BaNYxtyKR
	 eDTgB6YidzWwVdFy9rEPztW3/lhOWERBvdt0k6iDUtW9nDr/SNuVLLBURBGEkepKnZ
	 tEdGdi0vKyS+eHBom5htZm6wyeALz5mH5SLn3+kg08iRN4DcpfgaswEnbl6zFsSCl8
	 51FJF5pnPw0bOPUHBlZcZSXYTmSI0XJsHXkHEbSXv9vHi+C81NcmZCsekvko1/Rb2s
	 ec8YT4QahQHzV4VBH244ZwmeaRZEVcy6l9qEigbb/CG9WsHwb7eoN1/qIfozLQzCM6
	 V4fu7qaetErUg==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	brgl@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 0/6] driver core: remove software node from platform devices on device release
Date: Thu, 14 May 2026 02:24:00 +0200
Message-ID: <20260514002400.869648-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 13 May 2026 17:04:47 +0200, Bartosz Golaszewski wrote:
> [PATCH v6 0/6] driver core: remove software node from platform devices on device release

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/6] driver core: platform: remove software node on release()
      commit: 50030d63b4d3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
