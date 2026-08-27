Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97741DE0D;
	Thu, 27 Aug 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826639; cv=none; b=DDXcWXzbbGavP3yffvs2RrVWnfYbz8J4kCpkwVj6Edu0YzD7xXQIrUvVLJ/SJSJiIXYVANOh1WLizcdkMcM79icOUsZkNeGXuNEvaqdZdnulDYi+gthHyX4Wbk5/LNy+Uq+k3bcSuCiu/fYtl3C/YZnthoI2g8nZ/B5oJW576ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826639; c=relaxed/simple;
	bh=7ekKGGbZuvwDO+neykQuspbGWV6/gSgBkavgZKOyj2Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grjX5clX24A9DIz+DJPLbqIfUuIW6vfguNQ75rP+9LU0O1v48slhYQnwntBIZyHxXXeHHzALa/mwPrCi6Ubdxn8OEDaIkssbH94pwkwhErIjX/CduWz7wN0AC1TpLgTcwQeeLuieJtxG2XbE8E5PmCXtd7yZ0d44uR5pDf0Rv0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=malegzWv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="malegzWv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nBTqRlWsyLjGgBkUNwug7uOWo6HjsYJ6lPVLJnUSG7c=; b=malegzWveQRQCZS6tiI4IOAcFa
	mGxwZRvvKAuh57SxXRZ/fqIfenP1Mm48cSI7/jTd1dOFU4F8wXcIZzTvGHuXWTNA1UvUqaM3DIK4g
	qyIjY/ZB2ZL3Idtt1fZqUZS7lL4vjNzhr0imBDquvVZeioFwo24h6xaoKV99bJ9uz6gFkx52xQyPx
	oeaMg6arAaUikuUm6c7B7ziWIRiLQc0B2Pkr0kiLXa8B7FWnvwd5P9oiSMTC0APR27udC0SU8Rwat
	pufkGGVcrqGFIHKz1JTfaFND0WJ9hvA3HHzya6KDFuBdGDtbrbeTgpBBb8xayYQXjkWQRPLkhyn45
	eMRxPKig==;
Received: from [2001:8b0:10b:5:5216:8bb3:5927:52b6] (helo=u09cd745991455d.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXNC-0000000Cba3-2Nzb;
	Thu, 27 Aug 2026 10:30:18 +0000
Message-ID: <9b08e5a132cdc301eedbc084ec155bfb3646f3df.camel@infradead.org>
Subject: Re: [PATCH v6 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
From: David Woodhouse <dwmw2@infradead.org>
To: Maciek Machnikowski <maciek@machnikowski.net>, Arthur Kiyanovski
	 <akiyano@amazon.com>, David Miller <davem@davemloft.net>, Jakub Kicinski
	 <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
 <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,  Andrew Lunn
 <andrew@lunn.ch>, Carolina Jubran <cjubran@nvidia.com>, Wen Gu
 <guwen@linux.alibaba.com>,  Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Yonatan
 Sarna <ysarna@amazon.com>, Zorik Machulsky	 <zorik@amazon.com>, Alexander
 Matushevsky <matua@amazon.com>, Matt Wilson	 <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara	 <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal	 <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt	 <benh@amazon.com>,
 Noam Dagan <ndagan@amazon.com>, David Arinzon	 <darinzon@amazon.com>,
 Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik	 <ofirt@amazon.com>,
 Amit Bernstein <amitbern@amazon.com>, 	linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, shuah@kernel.org,  Jonathan Corbet	
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman	
 <horms@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	vadim.fedorenko@linux.dev, Ryan Luu <rluu@amazon.com>, Julien Ridoux	
 <ridouxj@amazon.com>
Date: Thu, 27 Aug 2026 11:30:05 +0100
In-Reply-To: <d43d255a-4a67-44c7-ab1e-5e08ac01a9c6@machnikowski.net>
References: <20260729233740.16516-1-akiyano@amazon.com>
	 <20260729233740.16516-2-akiyano@amazon.com>
	 <d43d255a-4a67-44c7-ab1e-5e08ac01a9c6@machnikowski.net>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-SSBXejccjtRJy/sO1zMw"
User-Agent: Evolution 3.60.3-0ubuntu1~ppa9~24.04 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-SSBXejccjtRJy/sO1zMw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-08-04 at 19:59 +0200, Maciek Machnikowski wrote:
>=20
> What is the practical use of UNRELIABLE vs UNKNOWN.

It's "known bad" vs. "take it with a pinch of salt and make your own
mind up".

> I think it can be simplified to UNRELIABLE, SYNCED and HOLDOVER. All
> clocks will start in UNRELIABLE, switch to SYNCED whenever the clock
> gets synchronized correctly and enter HOLDOVER if it was at the SYNCED
> state and report the last synced for that state. Status INITIALIZING has
> no practical meaning and requires more work from the APIs, and
> HOLDOVER->FREE_RUNNING state transition is undefined (what is
> "acceptable" for one application won't be acceptable for another)


It feels like we're deep into bikeshedding at this point. We *have* a
set of clock status fields defined in the VMClock specification:
https://uapi-group.org/specifications/specs/vmclock/

The best time to have this kind of discussion would have been when we
were working on that. In general the VMClock fields are largely based
on virtio-rtc and designed to be identical to it, but I believe the
status field is one of the ones that virtio-rtc dropped (or perhaps
never had).

We could absolutely have Linux define its own set of status values =E2=80=
=94
but it seems like there would have to be a *significant* improvement of
the status quo in order to want to do so, *and* we'd need to be able to
map to/from the VMClock values.

Even if we could come up with tweaks which would be a better model,
having to do that mapping probably ends up being a net loss.

Unless we feel strongly enough about these changes that it's worth
revising the spec?

> Do we need this many timescales defined here? Can't we just use the
> notion of TIMESCALE_ARBITRARY and TIMESCALE_ABSOLUTE with the UTC
> offset?=C2=A0

No, the difference between UTC and TAI is not (yet) just a constant
offset. And you can be on TAI without even knowing what the UTC offset
is =E2=80=94 arguably one of the use cases for TAI is for when you don't *w=
ant*
to know or care about UTC.

> CLOCK_MONOTONIC / MONOTONIC_RAW are really ARBITRARY, is there
> any value of differentating between those two?

Yes, they behave very differently. The _RAW version doesn't get
disciplined.

And it's also important to have a clear value for any smeared-
leapsecond abomination which *doesn't* pretend it's UTC.



> =C2=A0> +
> > =C2=A0/*
> > =C2=A0 * struct ptp_clock_time - represents a time value
> > =C2=A0 *
> > @@ -94,6 +237,136 @@ struct ptp_clock_time {
> > =C2=A0	__u32 reserved;
> > =C2=A0};
> > =C2=A0
> > +/*
> > + * Hardware counter identifiers for struct ptp_sys_time.sys_counter_id
> > + */
> > +enum ptp_counter_id {
> > +	/* Counter value not available or type not specified */
> > +	PTP_COUNTER_UNKNOWN =3D 0,
> > +
> > +	/* x86 Time Stamp Counter (TSC) */
> > +	PTP_COUNTER_X86_TSC =3D 1,
> > +
> > +	/* ARM Generic Timer virtual counter */
> > +	PTP_COUNTER_ARM_ARCH =3D 2,
> > +};
> > +
> > +/* Valid flags for struct ptp_clock_attrs.valid */
> > +#define PTP_ATTRS_VALID_ERROR_BOUND	(1 << 0)
> > +#define PTP_ATTRS_VALID_TIMESCALE	(1 << 1)
> > +#define PTP_ATTRS_VALID_STATUS		(1 << 2)
> > +
> > +/**
> > + * struct ptp_clock_attrs - quality attributes for a PHC timestamp
> > + *
> > + * @valid:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bitmask of PTP_ATTRS_VA=
LID_* indicating which fields
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 are populated. Zero means no attributes available.
> > + * @error_bound: Maximum error (an upper bound, in nanoseconds) betwee=
n the
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 returned device_time and true time on the advertised
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 @timescale; a worst-case bound, not a statistical estima=
te.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Valid only when PTP_ATTRS_VALID_ERROR_BOUND is set, and =
must
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 not be trusted when @status is PTP_CLOCK_STATUS_UNKNOWN =
or
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PTP_CLOCK_STATUS_UNRELIABLE.
> > + * @timescale:=C2=A0=C2=A0 Clock timescale (enum ptp_clock_timescale).=
 Valid only
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 when PTP_ATTRS_VALID_TIMESCALE is set.
> > + * @status:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Synchronization status (enum=
 ptp_clock_status). Valid
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 only when PTP_ATTRS_VALID_STATUS is set. Transitions bet=
ween
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 states are device-specific; there are no kernel-defined
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 thresholds relating @status to @error_bound.
> > + * @rsv:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reserved for =
future use, must be zero.
> > + */
> > +struct ptp_clock_attrs {
> > +	__u32 valid;
> > +	__u32 error_bound;
> > +	__u32 timescale;
> > +	__u32 status;
> > +	__u32 rsv[4];
> > +};
> This does not look like a practical model. Error bounds changes over
> time and will get stale by the time you transfer them over IOCTL.
>=20
> I think a more practical approach would be to return error_bound
> alongside the anchor_timestamp at which it was measured.=C2=A0

Huh, is that not exactly how they're used? They're passed in the
context of an actual timestamp ioctl.


> For example you
> can define master_offset for the RX timestamp of the Sync packet, or the
> offset for the last 1PPS signal you received. This should be
> complemented by some drift_factor that would define how fast it grows.
>=20
> If you capture the time from the PHC you can use the formula of
> error_bound+(phc_time - anchor_timestamp)*drift_factor to interpolate
> the boundaries.

I guess we could add that too but it wasn't the primary use case here,
as I understand it. A user fetching a timestamp wants to know the
bounds of *that* timestamp =E2=80=94 what is the latest, and the earliest, =
that
it could actually have been at the time in question. Tracking the
*ongoing* error bounds is a different game.

> Do we want to squash all errors into a single error_bound - it may make
> sense to add the hw_error and sync_error - hw_error would squash
> hw-based error bounds (such as clock resolution, GNSS precision) and
> sync_error (which would hold the dynamic part derived from the sync
> protocol)

Where does that end? Individually tracking an arbitrary number of error
hops all the way from the master / tier 1 clock? What's important is
the total resulting error, isn't it?

--=-SSBXejccjtRJy/sO1zMw
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
2CbrRqvKyIeSCvatKOyf2JEAAAAAAAA=


--=-SSBXejccjtRJy/sO1zMw--
