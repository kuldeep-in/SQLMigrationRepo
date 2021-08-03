
SET IDENTITY_INSERT SalesLT.ProductDescription ON
IF NOT EXISTS (SELECT 1 FROM SalesLT.ProductDescription WHERE [ProductDescriptionID] = 64) 
INSERT INTO SalesLT.ProductDescription ([ProductDescriptionID], [Description])
VALUES(64, 'This bike delivers a high-level of performance on a budget. It is responsive and maneuverable, and offers peace-of-mind when you decide to go off-road.')

IF NOT EXISTS (SELECT 1 FROM SalesLT.ProductDescription WHERE [ProductDescriptionID] = 88) 
INSERT INTO SalesLT.ProductDescription ([ProductDescriptionID], [Description])
VALUES(88, 'For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.')

IF NOT EXISTS (SELECT 1 FROM SalesLT.ProductDescription WHERE [ProductDescriptionID] = 168) 
INSERT INTO SalesLT.ProductDescription ([ProductDescriptionID], [Description])
VALUES(168, 'Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.')

IF NOT EXISTS (SELECT 1 FROM SalesLT.ProductDescription WHERE [ProductDescriptionID] = 337) 
INSERT INTO SalesLT.ProductDescription ([ProductDescriptionID], [Description])
VALUES(337, 'A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.')

IF NOT EXISTS (SELECT 1 FROM SalesLT.ProductDescription WHERE [ProductDescriptionID] = 457) 
INSERT INTO SalesLT.ProductDescription ([ProductDescriptionID], [Description])
VALUES(457, 'This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.')
SET IDENTITY_INSERT SalesLT.ProductDescription OFF