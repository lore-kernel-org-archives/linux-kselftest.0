Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794879042;
	b=uXEGVBv6cLYPCvW9W+OJfN38UuYgNBIBWN0/lYRQIkWXYdJyBaxKBvKldNULls9WM+eZ
	 4yzXEDbgNUHMi2SkRuIbNL9mo2ABWjWRKlBpCEzpRcJ66PZzgO3TaguzlSI3M+0WbDCP/
	 H99rPL1kfczMGcCYSu3nI9QX2xXOynidAMAxOhmIaMnivEq/S1MhExRlSpheza1EIiAFJ
	 s2esufLSnaJvEUiMmhfKYv1MzHvP7qCuE2jHJFS6ZixjFhb2HXD9AcIpXXiQZQKMuVhs8
	 CvF7mWFriK02NJoWGPmUICkT2TdNMBXXTv3YAGbf+krFq9mMkTONHQb8pZyC+Ae8N9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
	b=bPON4joyF7x8m+6YQwV+CNGKCsTaGWktZO/en/BlvxSy8xm1BS/JuVjXNXwwGTusoMQa
	 5Ti+N8eJmtnyBnXzXQSkQu9z4aQjRpAnbh3GBhp6ferBS7jOU8zy13QFfb30yItGp3FTX
	 f6PBpF67X7G5B8kTPF7Hg6QlHS0YPBXKLPHHXtpgVkT0qzdaoJzDlxWbh5GX/HxR+/tuu
	 RLSw6T9wawuUjE7ZvsoMKC9NCIBMxghDiz0FdhsdmaPgE8/3qr2kUpBzJwnQ/D11mSVYT
	 HI4FidYVoRE0roDPDiR/RxJDsDCKjyhLF2pv64nHiWegJhPZtZ21ToWbRJ2XBLkKf3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E36606A329
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 01:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E36606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5edf97136aaso3494407e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 17:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794879041; cv=none;
        d=google.com; s=arc-20260327;
        b=KUr8yfeR7bBltve/MlM0MtjzHn8JWWH4U+wzYI4+YDTchODlWbyX7jX2NgE/aHsAdm
         qMVwVvNOtlVEv3di8x8fIAzXqTcNi3oPoBtah9uWlOExBVp2JtyB+yNtlqQGQJ2hzY9r
         TA4/0nYFqpudfXnx4byeButPKgod2/dizMJx4YkjeRm+m0VuYvYeay1JTD7vfonFJYGA
         IfjYZk/iy4VF73bfEuHLC9nNzLU/0omo0RkU+lnSGHllEVw3ltyDOkXUuaMd0IOMGSWu
         wuCs2AQbg4AuiP/hFEyRHY8hhW+J78nNmi35aGss/b7nxtUhABUUuGGfOX8qf4eU3OW/
         mopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        fh=H093R8oJwMsAposqqTJZgeU7A2VtRUJ2FRf3kcca0dg=;
        b=fVe+p1W5pupd8J3HZeBUBl3Q/Yv6ccBUnF48K4sAMacT7j8Q6ksCoSzSMmg5oJK/yC
         aa0YvzFGDsGGGbiq4JVMMKSBQwjZXYGwKGKAEclX7Njd8fR1VsVj4fQgIfA4kGuQ35PR
         hlAXVmsfLFeqVnBbCr1LDXoyM8IUnCKQydwdzwhqFNPx0ay9uE84tRS/DY4yDWeaInjj
         4dnlBiGSd84GSmz1rjdKNlAvosyWjhgHsabtLpOoyLsSNKqGur7VvS91CYQILnryKbKs
         wwzQFeHBYdC2reQK0KZx7ldQ+nRGSAdBMKV7FXNW4lLB9D3ZZU0FtlJeYmyyY6+oGHh1
         JCxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794879041; x=1795483841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=G4sYMCymILpacviV7mjCOULNLDF3rKitytNMchDzU/yEFfaNdgaoTdJvm9yPP2LP0S
         Xh4bw+3IZR6wZDfD8uagDzYrh2q3JsGJw4ULl1l7gYqQblNn+2A2hQhLxT/TnWnvWFF+
         8lWCNnxcNTcCFWSTVsWEe7MohD2/jrgTeNizfAZyJwWNYfR1cEOYcr7zTcZaNbK3t32p
         YA5tdoLasMWMi5DMuHyy0tTcS+i+F7zvxLjbiCRyEFeKfMHb4luMG0cunaEbKKX7h5Vc
         k+sSZr56on6kqxWzPzvxazbeHu1jrsL6giLqWzinjnJ7F+68d4CIHK42jG19QVxAasX+
         whFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794879041; x=1795483841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=qu+oDFfMIadkeGQNZTqDr21IJbF69nIu3vKT29AlAbYkqBSmZl4gdZYDuN0Jri+s4/
         JNgKpudrlHdhzslIOql/o/9HnFSph2dWPefIEjrzKwcXWnzjepmE4sproo8pUs6ACUsJ
         ZcTBlycX5PRLoUr8NKT5a695P5nrDSnKKElz1HnRJQe43E5R2+UgNFJ01Kq3aK5eo/ed
         K0vvihlNstSB62MLaiTtZkk23c/328y3O2MUZD8uFxEN/PVsJbBI11yX97flD4tZKfsE
         qFzBrKuJoLwxWCqSBwZn4h05tnWw9xDPRaiYK9C7JI9p2a6y+4hMizM+NynidXmteFbC
         bfNA==
X-Forwarded-Encrypted: i=1; AL+hErGsIkrcKDt3guk95akDd8kgFkL1JLcT1hrbxduTsXX5ZCNBBs1n5hgXc+/c+o4Niom4Dl4oVrzkSBfWc2jknfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A8n8QDzzs90N38nOekI+9cwzuJSpMXogkz59gHfyqfsJ1c6vY
	ujxObVRDv5ZPmSCPLR6hDvvBFy3v0jah2gBSggt3aGZdZFe1ypVdtox90n67jQfzwNu1NFh9eRr
	c1ZXtvheMRAlFx/JSzlWVa822FmFwEmHbBLNw4NF2
X-Gm-Gg: AYBFou3YPC9wVnC/5QebXUotnD7D3jo8xprAljSvyN43gn7U6/2RlSxb4D9q8uD8zeJ
	Ofxsqg4w2e4RsufMpscl2fp1ahbbVUs1BCQFz74Avr+Nbv7C1jb2PNE0/toY+sGx173t4bXtZRe
	7FJ+JOhBaDkH/1r0QciGiABdWeM5cRvPVzTKmC4J4d7QSsSAy9oKfOlc1WSsPspOjUomoXP+u26
	SG40YSgp9shFMjdMEpSlimeh+SAPVMht3tTbBKQj1f85pg6lXtXv/b2g7rem6s2ni4d/TXs7/Gi
	EI0TDoKwfA1GSgA1Pw64f+mL1gPSVQCHcput5J30Z4RKIV5OoUVNL9fUNIKlIWBRcbVnKDKBqbi
	INcnc2E7mXL+BCbuRtlg21I5pS+XL+BJ3Pdk3plT8uNfHc0uOuJQRXCOmk9eTN5L3Z2m5j74=
X-Received: by 2002:a05:6122:29c5:b0:5ea:cd69:7cda with SMTP id
 71dfb90a1353d-5ee34a4a22fmr4937364e0c.7.1794879040840; Mon, 16 Nov 2026
 17:30:40 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora>
In-Reply-To: <avanVkILHDYdpond@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Mon, 16 Nov 2026 17:30:28 -0800
X-Gm-Features: AclHuK-byOO9ApLlxanSDYI9Lfieig8sHZUQyc_p9n6pRaoz5hWdciXbyY9EdzA
Message-ID: <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > Hi Pin-yen,
> > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > The prio test intermittently fails in the arp_ip_target and
> > > ns_ip6_target variants:
> > >
> > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL=
]
> > >     Current active slave is eth0 but not eth2
> > >
> > > The ARP/NS monitor marks a slave down when it has received nothing fo=
r
> > > too long. With arp_interval 100 and the default arp_missed_max, that =
is
> > > about 250ms for the active slave (eth1) and 350ms for a backup slave
> > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the repl=
y,
> > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Once et=
h1
> > > is down, its probes reach no one and no slave receives anything, so
> > > eth1 normally times out first and the new active slave is picked by
> > > prio:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D10   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 300ms -> down
> > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > >
> > > But the test takes eth1 down right after bond_check_connection(), who=
se
> > > ping replies only arrive on eth1:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D70   ping reply on eth1 only
> > >   t=3D85   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > >   t=3D400  monitor: eth1 idle 330ms -> down
> > >                   eth2 idle 400ms -> down too
> > >
> > > eth2 can then no longer be picked. eth0 becomes the active slave if i=
t
> > > happened to receive some other packet (e.g. an MLD report), otherwise
> > > whichever slave comes back first does. With primary_reselect 1 or 2,
> > > the bond keeps eth0 even after eth2 comes back.
> > >
> > > Before taking the active slave down, wait two monitor intervals
> > > (200ms), so that at least one more probe is sent after the last ping
> > > reply and all slaves last received that probe. The miimon variants do
> > > not need the wait, but the extra delay is negligible.
> >
> > I'm afraid the waiting time is too strict, especially with a debug kern=
el
> > since delays can happen.
> >
> > Bjoern is also fixing[1] this issue by pinging a non-existent neighbor =
to
> > keep traffic flowing. Would you like to test whether that works for you=
?
> >
> > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazo=
n.de/
>
> BTW, using ping may not able to triger the arp request in time. You can t=
ry
> arping instead.

Thanks for the pointer, but I believe Bjoern's patch addresses a
different problem.

Bjoern's patch keeps the traffic flowing so that idle slaves are kept
alive between the test steps. This patch fixes the case where the ping
replies from bond_check_connection() only arrive on the active slave
right before it is set down. The active slave's failure is then
detected one monitor interval late, when the backups have also timed
out.

The ARP requests triggered by Bjoern's ping are sent only about once
per second, which isn't frequent enough for this failure. I tested
Bjoern's patch and confirmed that it didn't fix the issue in our
testing environment. We also can't simply use arping instead because
iputils arping doesn't support sub-second intervals.

If you're worried that the 200ms sleep is too short, would increasing
it to 0.5s or 1s work for you?
>
>
> Thanks
> Hangbin

Regards,
Pin-yen
