
ALTER TABLE vouchers
ADD IsCancelled bit NULL;
go
ALTER TABLE vouchers
ADD CancelledBy int NULL;
go
ALTER TABLE vouchers
ADD CancelledOn datetime NULL;
go
update vouchers set IsCancelled = 0
go
ALTER TABLE VoucherDetails
ADD IsCancelled bit NULL;
go
update VoucherDetails set IsCancelled = 0
go