From: petrm@mellanox.com (Petr Machata)
Date: Mon, 19 Nov 2018 16:25:23 +0000
Subject: [PATCH net-next 18/18] selftests: mlxsw: Add a test for VxLAN
 flooding
In-Reply-To: <20181119161006.5405-19-idosch@mellanox.com> (Ido Schimmel's
 message of "Mon, 19 Nov 2018 17:11:27 +0100")
References: <20181119161006.5405-1-idosch@mellanox.com>
 <20181119161006.5405-19-idosch@mellanox.com>
Message-ID: <wihr2fhhwah.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181119162523.Osu47OcWFWWXirW2UuSLIrTVKpWkFEWcIkgxx1-fNCU@z>

Ido Schimmel <idosch at mellanox.com> writes:

> The device stores flood records in a singly linked list where each
> record stores up to three IPv4 addresses of remote VTEPs. The test
> verifies that packets are correctly flooded in various cases such as
> deletion of a record in the middle of the list.
>
> Signed-off-by: Ido Schimmel <idosch at mellanox.com>

Reviewed-by: Petr Machata <petrm at mellanox.com>
